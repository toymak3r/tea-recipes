# Tea Recipe Format - Quick Reference

## Minimal Recipe Template

```json
{
  "id": "my-tea-001",
  "schemaVersion": "1.0.0",
  "name": "My Tea Recipe",
  "teaType": "green",
  "brewingSteps": [
    {
      "step": 1,
      "action": "heat_water",
      "temperature": {"value": 80, "unit": "celsius"},
      "duration": {"value": 120, "unit": "seconds"}
    },
    {
      "step": 2,
      "action": "steep",
      "temperature": {"value": 80, "unit": "celsius"},
      "duration": {"value": 180, "unit": "seconds"}
    }
  ]
}
```

## Tea Types

- `black` - Black tea
- `green` - Green tea
- `white` - White tea
- `oolong` - Oolong tea
- `pu-erh` - Pu-erh tea
- `herbal` - Herbal infusions
- `fruit` - Fruit teas
- `rooibos` - Rooibos tea
- `blend` - Tea blends
- `other` - Other types

## Brewing Actions

| Action | Description | Required Fields |
|--------|-------------|-----------------|
| `heat_water` | Heat water to temperature | `temperature`, `duration` |
| `add_tea` | Add tea leaves/bags | `ingredient` |
| `steep` | Steep at temperature | `temperature`, `duration` |
| `remove_tea` | Remove/strain tea | - |
| `add_ingredient` | Add additional ingredient | `ingredient` |
| `stir` | Stir mixture | `duration` (optional) |
| `wait` | Wait period | `duration` |
| `serve` | Serve the tea | - |

## Temperature Guidelines

| Tea Type | Temperature (°C) | Temperature (°F) |
|----------|------------------|------------------|
| White | 65-75 | 149-167 |
| Green | 70-80 | 158-176 |
| Oolong | 80-90 | 176-194 |
| Black | 90-95 | 194-203 |
| Pu-erh | 95-100 | 203-212 |
| Herbal | 100 | 212 |

## Steeping Time Guidelines

| Tea Type | First Steep | Subsequent Steeps |
|----------|-------------|-------------------|
| White | 2-5 min | +30s each |
| Green | 1-3 min | +15s each |
| Oolong | 2-4 min | +30s each |
| Black | 3-5 min | N/A |
| Pu-erh | 30s-1 min | +15s each |
| Herbal | 5-7 min | N/A |

## Units Reference

### Temperature
- `celsius` (recommended)
- `fahrenheit`

### Time
- `seconds` (recommended for precision)
- `minutes`

### Volume
- `ml` (recommended)
- `oz`
- `cups`

### Weight
- `g` (grams)
- `tsp` (teaspoon)
- `tbsp` (tablespoon)

### Count
- `pieces`
- `bags`

## Device Features

Specify required device capabilities:

```json
{
  "deviceCompatibility": {
    "minSchemaVersion": "1.0.0",
    "requiredFeatures": [
      "temperature_control",
      "timer",
      "auto_dispense",
      "multi_step",
      "steep_reminder"
    ]
  }
}
```

## Validation

### Python
```bash
python tools/validate.py examples/my-recipe.json
python tools/validate.py --all
```

### JavaScript (Node.js)
```bash
npm install -g ajv-cli
ajv validate -s schema/tea-recipe.schema.json -d examples/my-recipe.json
```

## Common Patterns

### Optional Ingredients
```json
{
  "name": "milk",
  "amount": 30,
  "unit": "ml",
  "optional": true
}
```

### Metadata Tags
```json
{
  "metadata": {
    "tags": ["morning", "energizing", "classic"],
    "difficulty": "beginner",
    "caffeineLevel": "medium"
  }
}
```

### Nutritional Info
```json
{
  "nutritionalInfo": {
    "calories": 2,
    "caffeine": {
      "amount": 25,
      "unit": "mg"
    }
  }
}
```

## File Organization

Recommended structure:
```
tea-recipes/
├── schema/
│   └── tea-recipe.schema.json
├── examples/
│   ├── green-tea-sencha.json
│   ├── earl-grey-black-tea.json
│   └── masala-chai.json
├── tools/
│   └── validate.py
└── recipes/
    └── your-recipes-here.json
```

## Naming Conventions

### Recipe IDs
- Format: `{type}-{name}-{version}`
- Example: `green-tea-sencha-001`
- Use lowercase with hyphens
- Use UUIDs for auto-generated recipes

### File Names
- Match recipe name in lowercase
- Use hyphens for spaces
- Example: `masala-chai.json`

## Best Practices

1. ✅ Always include `schemaVersion`
2. ✅ Use Celsius for temperature
3. ✅ Use seconds for time < 5 minutes
4. ✅ Test recipes on actual devices
5. ✅ Validate before sharing
6. ✅ Include human-readable instructions
7. ✅ Specify device requirements
8. ❌ Don't skip required fields
9. ❌ Don't use extreme values (temp > 100°C)
10. ❌ Don't exceed 50KB file size

## Error Handling

Common validation errors:

- **Missing required field**: Add all required fields (`id`, `schemaVersion`, `name`, `teaType`, `brewingSteps`)
- **Invalid enum value**: Check `teaType` and `action` values match allowed list
- **Invalid temperature**: Ensure 0-100°C range
- **Missing units**: Always specify `unit` field for measurements
- **Invalid step sequence**: Steps must start at 1 and be sequential

## Support

- Full documentation: `FORMAT_SPECIFICATION.md`
- Example recipes: `examples/` directory
- Schema file: `schema/tea-recipe.schema.json`
