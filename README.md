# Tea Recipes - Universal Format Standard

A standardized JSON format for tea recipes designed for cross-platform compatibility and IoT device integration. Perfect for tea-making machines, mobile apps, web applications, and smart home devices.

## Why This Format?

✅ **Universal Compatibility** - Works across all platforms and programming languages
✅ **IoT-Optimized** - Lightweight and efficient for embedded devices
✅ **Machine-Readable** - Structured data for automated tea makers
✅ **Human-Friendly** - Easy to read, write, and debug
✅ **Validated** - JSON Schema ensures data integrity
✅ **Extensible** - Future-proof design with versioning support

## Quick Start

### Example Recipe

```json
{
  "id": "green-tea-sencha-001",
  "schemaVersion": "1.0.0",
  "name": "Classic Japanese Sencha",
  "teaType": "green",
  "brewingSteps": [
    {
      "step": 1,
      "action": "heat_water",
      "temperature": {"value": 75, "unit": "celsius"},
      "duration": {"value": 120, "unit": "seconds"}
    },
    {
      "step": 2,
      "action": "steep",
      "temperature": {"value": 75, "unit": "celsius"},
      "duration": {"value": 60, "unit": "seconds"}
    }
  ]
}
```

### Validate a Recipe

```bash
# Python
python tools/validate.py examples/green-tea-sencha.json
python tools/validate.py --all

# JavaScript
npm install -g ajv-cli
ajv validate -s schema/tea-recipe.schema.json -d examples/green-tea-sencha.json
```

## Documentation

- **[FORMAT_SPECIFICATION.md](FORMAT_SPECIFICATION.md)** - Complete format documentation
- **[QUICK_REFERENCE.md](QUICK_REFERENCE.md)** - Quick reference guide
- **[schema/tea-recipe.schema.json](schema/tea-recipe.schema.json)** - JSON Schema definition
- **[examples/](examples/)** - Sample recipes

## Features

### Comprehensive Recipe Structure

- **Precise Brewing Parameters** - Temperature, time, amounts
- **Step-by-Step Instructions** - Sequential actions for automation
- **Ingredient Management** - Amounts, units, optional items
- **Metadata** - Tags, difficulty, nutritional info
- **Device Compatibility** - Feature requirements and capabilities

### Standard Units

- Temperature: Celsius (primary), Fahrenheit (supported)
- Time: Seconds, Minutes
- Volume: ml, oz, cups
- Weight: grams, tsp, tbsp

### Supported Tea Types

`black` · `green` · `white` · `oolong` · `pu-erh` · `herbal` · `fruit` · `rooibos` · `blend` · `other`

### Brewing Actions

- `heat_water` - Heat water to temperature
- `add_tea` - Add tea leaves/bags
- `steep` - Steep at temperature
- `remove_tea` - Remove/strain tea
- `add_ingredient` - Add supplementary items
- `stir` - Mix ingredients
- `wait` - Passive waiting
- `serve` - Serve the tea

## Examples

Browse the `examples/` directory for sample recipes:

- **[green-tea-sencha.json](examples/green-tea-sencha.json)** - Simple beginner recipe
- **[earl-grey-black-tea.json](examples/earl-grey-black-tea.json)** - Recipe with optional ingredients
- **[masala-chai.json](examples/masala-chai.json)** - Complex multi-step recipe

## For Developers

### IoT Device Integration

```cpp
// Arduino/ESP32 Example
#include <ArduinoJson.h>

StaticJsonDocument<4096> doc;
deserializeJson(doc, recipeJson);

// Validate schema version
const char* version = doc["schemaVersion"];

// Execute brewing steps
JsonArray steps = doc["brewingSteps"];
for (JsonVariant step : steps) {
  executeStep(step);
}
```

### Mobile/Web Apps

```javascript
// JavaScript/TypeScript
import Ajv from 'ajv';
import schema from './schema/tea-recipe.schema.json';
import recipe from './recipes/my-tea.json';

const ajv = new Ajv();
const validate = ajv.compile(schema);

if (validate(recipe)) {
  console.log('Recipe is valid!');
  brewTea(recipe);
} else {
  console.error(validate.errors);
}
```

### Python Applications

```python
import json
import jsonschema

with open('schema/tea-recipe.schema.json') as f:
    schema = json.load(f)

with open('recipes/my-tea.json') as f:
    recipe = json.load(f)

jsonschema.validate(instance=recipe, schema=schema)
```

## Repository Structure

```
tea-recipes/
├── schema/
│   └── tea-recipe.schema.json    # JSON Schema definition
├── examples/
│   ├── green-tea-sencha.json     # Simple recipe
│   ├── earl-grey-black-tea.json  # Intermediate recipe
│   └── masala-chai.json          # Complex recipe
├── tools/
│   └── validate.py               # Recipe validator
├── FORMAT_SPECIFICATION.md       # Complete documentation
├── QUICK_REFERENCE.md            # Quick reference guide
└── README.md                     # This file
```

## Use Cases

- 🤖 **Smart Tea Makers** - Automated brewing with precise control
- 📱 **Mobile Apps** - Recipe libraries and brewing timers
- 🌐 **Web Applications** - Recipe sharing platforms
- 🏠 **Smart Home Integration** - Voice assistant compatibility
- 📊 **Data Analysis** - Tea preference analytics
- 🎓 **Educational** - Teaching tea preparation techniques

## Why JSON Over Alternatives?

| Requirement | JSON | XML | YAML | Protobuf |
|-------------|------|-----|------|----------|
| IoT Support | ✅ Excellent | ⚠️ Heavy | ❌ Limited | ⚠️ Requires codegen |
| Human Readable | ✅ Yes | ⚠️ Verbose | ✅ Yes | ❌ Binary |
| Parse Speed | ✅ Fast | ❌ Slow | ❌ Slow | ✅ Fastest |
| Schema Support | ✅ JSON Schema | ✅ XSD | ⚠️ Limited | ✅ .proto |
| Size | ⚠️ Medium | ❌ Large | ✅ Small | ✅ Smallest |
| Universal Support | ✅ Yes | ✅ Yes | ⚠️ Partial | ❌ No |

**Conclusion**: JSON provides optimal balance for tea recipe sharing.

## Contributing

We welcome contributions! Please ensure:

1. ✅ Recipes validate against the schema
2. ✅ Follow naming conventions
3. ✅ Include complete metadata
4. ✅ Test on actual devices when possible
5. ✅ Maintain backward compatibility

## Version

Current Schema Version: **1.0.0**

## License

MIT License - See [LICENSE](LICENSE) file for details

## Support

- 📖 Read the [full specification](FORMAT_SPECIFICATION.md)
- 📝 Check the [quick reference](QUICK_REFERENCE.md)
- 🔍 Browse [example recipes](examples/)
- 🐛 Report issues via GitHub Issues

---

Made with ☕ for the tea community
