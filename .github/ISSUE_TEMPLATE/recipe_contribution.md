---
name: Recipe Contribution
about: Submit a new tea recipe or improve an existing one
title: '[RECIPE] '
labels: recipe, contribution
assignees: ''
---

## Recipe Information
- **Name**:
- **Tea Type**: [black/green/white/oolong/pu-erh/herbal/fruit/rooibos/blend/other]
- **Origin**:
- **Difficulty**: [beginner/intermediate/advanced]

## Recipe JSON
Please provide your recipe in valid JSON format:
```json
{
  "id": "",
  "schemaVersion": "1.0.0",
  ...
}
```

## Validation
- [ ] Recipe validates against schema using `python tools/validate.py`
- [ ] Tested on actual device (if applicable)
- [ ] Follows naming conventions
- [ ] Includes complete metadata

## Device Requirements
List the device features required:
- [ ] temperature_control
- [ ] timer
- [ ] auto_dispense
- [ ] multi_step
- [ ] steep_reminder

## Brewing Notes
Any special notes about brewing this tea:
- Optimal temperature range:
- Resteeping capability:
- Special considerations:

## Testing
If you've tested this recipe:
- Device/Platform used:
- Results:
- Photos (optional):
