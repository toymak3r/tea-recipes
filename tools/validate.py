#!/usr/bin/env python3
"""
Tea Recipe Validator
Validates tea recipe JSON files against the schema
"""

import json
import sys
import os
from pathlib import Path

try:
    import jsonschema
except ImportError:
    print("Error: jsonschema module not found")
    print("Install with: pip install jsonschema")
    sys.exit(1)


def validate_recipe(recipe_path, schema_path):
    """Validate a single recipe file against the schema"""
    try:
        # Load schema
        with open(schema_path, 'r', encoding='utf-8') as f:
            schema = json.load(f)

        # Load recipe
        with open(recipe_path, 'r', encoding='utf-8') as f:
            recipe = json.load(f)

        # Validate
        jsonschema.validate(instance=recipe, schema=schema)

        return True, None

    except json.JSONDecodeError as e:
        return False, f"Invalid JSON: {e}"

    except jsonschema.exceptions.ValidationError as e:
        return False, f"Schema validation failed: {e.message}"

    except FileNotFoundError as e:
        return False, f"File not found: {e}"

    except Exception as e:
        return False, f"Unexpected error: {e}"


def validate_directory(directory, schema_path):
    """Validate all JSON files in a directory"""
    results = []
    json_files = list(Path(directory).glob('*.json'))

    if not json_files:
        print(f"No JSON files found in {directory}")
        return []

    for recipe_file in json_files:
        valid, error = validate_recipe(recipe_file, schema_path)
        results.append({
            'file': recipe_file.name,
            'valid': valid,
            'error': error
        })

    return results


def main():
    """Main entry point"""
    if len(sys.argv) < 2:
        print("Usage:")
        print("  python validate.py <recipe.json>          # Validate single file")
        print("  python validate.py <directory>            # Validate all JSON in directory")
        print("  python validate.py --all                  # Validate all examples")
        sys.exit(1)

    # Find schema file
    script_dir = Path(__file__).parent
    repo_root = script_dir.parent
    schema_path = repo_root / 'schema' / 'tea-recipe.schema.json'

    if not schema_path.exists():
        print(f"Error: Schema file not found at {schema_path}")
        sys.exit(1)

    target = sys.argv[1]

    # Validate all examples
    if target == '--all':
        examples_dir = repo_root / 'examples'
        if not examples_dir.exists():
            print(f"Error: Examples directory not found at {examples_dir}")
            sys.exit(1)

        print("Validating all example recipes...")
        print("=" * 60)
        results = validate_directory(examples_dir, schema_path)

        # Print results
        passed = 0
        failed = 0
        for result in results:
            status = "✓ PASS" if result['valid'] else "✗ FAIL"
            print(f"{status}: {result['file']}")
            if not result['valid']:
                print(f"  Error: {result['error']}")
                failed += 1
            else:
                passed += 1

        print("=" * 60)
        print(f"Results: {passed} passed, {failed} failed out of {len(results)} total")

        sys.exit(0 if failed == 0 else 1)

    # Validate single file or directory
    target_path = Path(target)

    if not target_path.exists():
        print(f"Error: {target} not found")
        sys.exit(1)

    if target_path.is_file():
        # Single file validation
        print(f"Validating: {target_path.name}")
        valid, error = validate_recipe(target_path, schema_path)

        if valid:
            print("✓ Recipe is valid!")

            # Show some basic info
            with open(target_path, 'r') as f:
                recipe = json.load(f)
                print(f"\nRecipe: {recipe.get('name', 'N/A')}")
                print(f"Type: {recipe.get('teaType', 'N/A')}")
                print(f"Steps: {len(recipe.get('brewingSteps', []))}")
        else:
            print(f"✗ Validation failed:")
            print(f"  {error}")
            sys.exit(1)

    elif target_path.is_dir():
        # Directory validation
        print(f"Validating all JSON files in: {target_path}")
        print("=" * 60)
        results = validate_directory(target_path, schema_path)

        passed = 0
        failed = 0
        for result in results:
            status = "✓ PASS" if result['valid'] else "✗ FAIL"
            print(f"{status}: {result['file']}")
            if not result['valid']:
                print(f"  Error: {result['error']}")
                failed += 1
            else:
                passed += 1

        print("=" * 60)
        print(f"Results: {passed} passed, {failed} failed")

        sys.exit(0 if failed == 0 else 1)


if __name__ == '__main__':
    main()
