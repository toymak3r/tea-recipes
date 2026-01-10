# Tea Recipe Format Specification v1.0.0

## Overview

This specification defines a standardized JSON format for tea recipes designed for cross-platform compatibility and IoT device integration. The format is optimized for tea-making machines, mobile apps, web applications, and smart home devices.

## Why JSON for IoT Tea Recipes?

### ✅ Advantages for IoT and Cross-Platform Use

1. **Universal Support**: JSON parsers available for all major platforms (C, C++, Python, JavaScript, Java, Go, Rust)
2. **Lightweight**: Minimal overhead, suitable for memory-constrained devices (ESP32, Arduino, Raspberry Pi)
3. **Human-Readable**: Easy debugging, manual editing, and version control
4. **Schema Validation**: JSON Schema provides robust validation
5. **No Dependencies**: No special libraries needed on most platforms
6. **UTF-8 Native**: International character support for tea names in any language
7. **Streaming Support**: Can be parsed incrementally on low-memory devices

### Comparison with Alternatives

| Format | Size | Parse Speed | IoT Support | Human Readable | Schema |
|--------|------|-------------|-------------|----------------|--------|
| **JSON** | Medium | Fast | ✅ Excellent | ✅ Yes | ✅ JSON Schema |
| XML | Large | Slow | ⚠️ Heavy | ⚠️ Verbose | ✅ XSD |
| YAML | Small | Slow | ❌ Limited | ✅ Yes | ⚠️ Limited |
| Protocol Buffers | Smallest | Fastest | ⚠️ Requires codegen | ❌ No | ✅ .proto |
| MessagePack | Small | Very Fast | ⚠️ Limited libs | ❌ Binary | ❌ No |

**Verdict**: JSON provides the best balance of compatibility, readability, and performance for tea recipe sharing across diverse platforms.

## Schema Structure

### Core Required Fields

```json
{
  "id": "unique-recipe-identifier",
  "schemaVersion": "1.0.0",
  "name": "Recipe Name",
  "teaType": "green|black|white|oolong|pu-erh|herbal|fruit|rooibos|blend|other",
  "brewingSteps": [...]
}
```

### Standard Units

To ensure consistency across devices:

- **Temperature**: Celsius (primary), Fahrenheit (supported)
- **Time**: Seconds (preferred for precision), Minutes (for longer durations)
- **Volume**: ml (primary), oz (supported), cups (supported)
- **Weight**: grams (g)
- **Small amounts**: tsp, tbsp

### Brewing Steps Actions

The `brewingSteps` array defines a sequence of machine-executable actions:

- `heat_water`: Heat water to specified temperature
- `add_tea`: Dispense tea leaves/bags
- `steep`: Maintain temperature for duration
- `remove_tea`: Signal to remove/strain tea
- `add_ingredient`: Add supplementary ingredients
- `stir`: Stir/agitate mixture
- `wait`: Passive waiting period
- `serve`: Final serving signal

### Device Compatibility

The `deviceCompatibility` object helps devices determine if they can execute a recipe:

```json
{
  "deviceCompatibility": {
    "minSchemaVersion": "1.0.0",
    "requiredFeatures": [
      "temperature_control",
      "timer",
      "auto_dispense",
      "multi_step"
    ]
  }
}
```

#### Standard Device Features

- `temperature_control`: Precise temperature regulation
- `timer`: Countdown and duration tracking
- `auto_dispense`: Automatic ingredient dispensing
- `multi_step`: Support for sequential operations
- `steep_reminder`: Notifications for steep completion

## Implementation Guidelines

### For IoT Device Manufacturers

1. **Memory Considerations**
   - Use streaming JSON parser (e.g., ArduinoJson, jsmn, cJSON)
   - Parse steps sequentially rather than loading entire file
   - Typical recipe < 5KB, fits in most device RAM

2. **Temperature Handling**
   - Support Celsius as primary unit
   - Convert Fahrenheit if device uses different units
   - Allow ±2°C tolerance for practical brewing

3. **Error Handling**
   - Validate schema version before parsing
   - Check `requiredFeatures` against device capabilities
   - Provide clear error messages for unsupported recipes

4. **Example Arduino/ESP32 Implementation**
   ```cpp
   #include <ArduinoJson.h>

   bool parseTeaRecipe(const char* json) {
     StaticJsonDocument<4096> doc;
     DeserializationError error = deserializeJson(doc, json);

     if (error) return false;

     // Check schema version
     const char* version = doc["schemaVersion"];
     if (strcmp(version, "1.0.0") != 0) return false;

     // Check device compatibility
     JsonArray features = doc["deviceCompatibility"]["requiredFeatures"];
     for (JsonVariant feature : features) {
       if (!deviceSupports(feature.as<const char*>())) {
         return false;
       }
     }

     // Execute brewing steps
     JsonArray steps = doc["brewingSteps"];
     for (JsonVariant step : steps) {
       executeStep(step);
     }

     return true;
   }
   ```

### For App Developers

1. **Schema Validation**
   - Validate recipes against JSON Schema before use
   - Use libraries: `ajv` (JavaScript), `jsonschema` (Python), `serde_json` (Rust)

2. **User Interface**
   - Display `metadata.difficulty` for user guidance
   - Show `nutritionalInfo` for health-conscious users
   - Filter by `teaType` and `metadata.tags`

3. **Temperature Display**
   - Offer user preference for Celsius/Fahrenheit
   - Show both units for international users

4. **Offline Support**
   - Bundle common recipes with app
   - Sync via JSON files or API endpoints

### For Recipe Creators

1. **ID Naming Convention**
   - Use format: `{tea-type}-{variant}-{version}`
   - Example: `green-tea-sencha-001`
   - Use UUIDs for generated recipes

2. **Precision Guidelines**
   - Temperature: ±1°C accuracy
   - Time: Use seconds for < 5 minutes, minutes for longer
   - Amounts: Round to practical measurements

3. **Testing**
   - Validate with JSON Schema validator
   - Test on actual devices when possible
   - Document device compatibility

## Validation

### Using JSON Schema Validators

**Command Line (ajv-cli)**:
```bash
npm install -g ajv-cli
ajv validate -s schema/tea-recipe.schema.json -d examples/green-tea-sencha.json
```

**Python**:
```python
import json
import jsonschema

with open('schema/tea-recipe.schema.json') as schema_file:
    schema = json.load(schema_file)

with open('examples/green-tea-sencha.json') as recipe_file:
    recipe = json.load(recipe_file)

jsonschema.validate(instance=recipe, schema=schema)
```

**JavaScript**:
```javascript
const Ajv = require('ajv');
const ajv = new Ajv();

const schema = require('./schema/tea-recipe.schema.json');
const recipe = require('./examples/green-tea-sencha.json');

const validate = ajv.compile(schema);
const valid = validate(recipe);

if (!valid) console.log(validate.errors);
```

## Versioning and Compatibility

### Schema Versioning (Semantic Versioning)

- **MAJOR** (1.x.x): Breaking changes, devices must update
- **MINOR** (x.1.x): New optional fields, backward compatible
- **PATCH** (x.x.1): Documentation, clarifications

### Forward Compatibility

Devices should:
- Ignore unknown fields
- Support older schema versions
- Gracefully degrade for missing optional features

### Backward Compatibility

New schema versions must:
- Keep all required fields
- Make new fields optional
- Document migration path

## Security Considerations

1. **Input Validation**
   - Always validate against schema
   - Sanitize user-provided recipe data
   - Check for reasonable value ranges (temp < 100°C, time < 24 hours)

2. **Device Safety**
   - Implement hardware safety limits
   - Timeout for operations
   - Emergency stop mechanisms

3. **File Size Limits**
   - Recommend max 50KB per recipe
   - Prevent DoS via large files

## Future Extensions

Potential future enhancements (v2.0.0):

- Multi-language support (`i18n` field)
- Nutritional information expansion
- Allergen warnings
- Water quality parameters (TDS, pH)
- Resteeping instructions for oolong/pu-erh
- Voice assistant integration metadata
- Recipe variants/substitutions
- User ratings and reviews structure

## Examples

See `/examples` directory for:
- `green-tea-sencha.json` - Simple beginner recipe
- `earl-grey-black-tea.json` - Recipe with optional ingredients
- `masala-chai.json` - Complex multi-step recipe

## License

This specification is released under MIT License. See LICENSE file for details.

## Contributing

Proposed changes to the specification should:
1. Maintain backward compatibility
2. Include rationale and use cases
3. Provide implementation examples
4. Update version number appropriately

## Contact

For questions, issues, or suggestions, please open an issue in the repository.
