#!/bin/bash

# Tea Recipes - GitHub Project Setup Script
# This script creates labels, milestones, and issues for project management

set -e  # Exit on error

echo "🍵 Tea Recipes - GitHub Project Setup"
echo "======================================"
echo ""

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ Error: GitHub CLI (gh) is not installed"
    echo "Install from: https://cli.github.com/"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo "❌ Error: Not authenticated with GitHub"
    echo "Run: gh auth login"
    exit 1
fi

echo "✅ GitHub CLI is installed and authenticated"
echo ""

# Confirm before proceeding
read -p "This will create labels, milestones, and issues. Continue? (y/n) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Cancelled."
    exit 0
fi

echo ""
echo "📋 Creating Labels..."
echo "--------------------"

# Core Labels
gh label create "bug" --description "Something isn't working" --color "d73a4a" --force
gh label create "enhancement" --description "New feature or request" --color "a2eeef" --force
gh label create "documentation" --description "Improvements or additions to documentation" --color "0075ca" --force
gh label create "recipe" --description "New recipe or recipe improvements" --color "7057ff" --force
gh label create "schema" --description "Schema changes or additions" --color "d4c5f9" --force

# Priority Labels
gh label create "priority: critical" --description "Critical priority" --color "b60205" --force
gh label create "priority: high" --description "High priority" --color "d93f0b" --force
gh label create "priority: medium" --description "Medium priority" --color "fbca04" --force
gh label create "priority: low" --description "Low priority" --color "0e8a16" --force

# Category Labels
gh label create "category: iot" --description "IoT device related" --color "1d76db" --force
gh label create "category: mobile" --description "Mobile app related" --color "5319e7" --force
gh label create "category: web" --description "Web application related" --color "006b75" --force
gh label create "category: tools" --description "Developer tools" --color "bfd4f2" --force

# Status Labels
gh label create "good first issue" --description "Good for newcomers" --color "7057ff" --force
gh label create "help wanted" --description "Extra attention is needed" --color "008672" --force
gh label create "contribution" --description "Community contribution" --color "eb6420" --force
gh label create "community" --description "Community initiatives" --color "ff69b4" --force

# Version Labels
gh label create "v1.0.x" --description "Version 1.0.x" --color "c2e0c6" --force
gh label create "v1.1.x" --description "Version 1.1.x" --color "c2e0c6" --force
gh label create "v1.2.x" --description "Version 1.2.x" --color "c2e0c6" --force
gh label create "v2.0.x" --description "Version 2.0.x" --color "c2e0c6" --force

echo "✅ Labels created"
echo ""

echo "🎯 Creating Milestones..."
echo "-------------------------"

# Note: Milestones need to be created via API as gh CLI milestone support is limited
# We'll use gh api command

gh api repos/:owner/:repo/milestones \
  -X POST \
  -f title="v1.1.0 Community & Ecosystem" \
  -f description="Community tools, expanded recipe library, platform guides, and developer resources" \
  -f due_on="2026-03-31T00:00:00Z" \
  -f state="open" 2>/dev/null || echo "Milestone v1.1.0 may already exist"

gh api repos/:owner/:repo/milestones \
  -X POST \
  -f title="v1.2.0 Advanced Features" \
  -f description="Multi-language support, resteeping instructions, water quality parameters, and enhanced metadata" \
  -f due_on="2026-06-30T00:00:00Z" \
  -f state="open" 2>/dev/null || echo "Milestone v1.2.0 may already exist"

gh api repos/:owner/:repo/milestones \
  -X POST \
  -f title="v2.0.0 Next Generation" \
  -f description="AI/ML integration, voice assistants, smart device ecosystem, and major enhancements" \
  -f due_on="2026-12-31T00:00:00Z" \
  -f state="open" 2>/dev/null || echo "Milestone v2.0.0 may already exist"

gh api repos/:owner/:repo/milestones \
  -X POST \
  -f title="Ongoing Maintenance" \
  -f description="Continuous improvements, bug fixes, and documentation updates" \
  -f state="open" 2>/dev/null || echo "Milestone Ongoing may already exist"

echo "✅ Milestones created"
echo ""

echo "📝 Creating Issues..."
echo "---------------------"

# Ask if user wants to create all issues
read -p "Create all 21 issues? This may take a minute. (y/n) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Skipping issue creation. You can create them manually from planning/GITHUB_SETUP.md"
    echo ""
    echo "✅ Setup complete!"
    exit 0
fi

# v1.1.0 Issues

echo "Creating issue: Chinese Tea Recipes..."
gh issue create \
  --title "Add traditional Chinese tea recipes (Longjing, Tieguanyin, Pu-erh)" \
  --body-file <(cat <<'EOF'
Add authentic Chinese tea recipes to the examples directory.

**Goal**: Include 5+ traditional Chinese tea recipes

**Recipes to add**:
- [ ] Longjing (Dragon Well) Green Tea
- [ ] Tieguanyin Oolong
- [ ] Aged Pu-erh
- [ ] Jasmine Green Tea
- [ ] White Peony (Bai Mudan)

**Requirements**:
- Follow schema v1.0.0
- Include proper metadata (origin, difficulty, tags)
- Validate against schema
- Add brewing notes in metadata
EOF
) \
  --label "recipe,v1.1.x,help wanted,good first issue" || echo "Issue may already exist"

echo "Creating issue: Cold Brew Recipes..."
gh issue create \
  --title "Create cold brew tea recipes" \
  --body-file <(cat <<'EOF'
Add cold brew recipes for popular tea types.

**Goal**: Support cold brew preparation methods

**Recipes needed**:
- [ ] Cold brew green tea
- [ ] Cold brew black tea
- [ ] Cold brew herbal tea
- [ ] Sun tea variations

**Technical considerations**:
- Use lower temperatures (room temp or refrigerated)
- Longer steep times (4-12 hours)
- Document proper cold brew technique
EOF
) \
  --label "recipe,enhancement,v1.1.x" || echo "Issue may already exist"

echo "Creating issue: JavaScript Validator..."
gh issue create \
  --title "Create JavaScript/TypeScript validation library" \
  --body-file <(cat <<'EOF'
Build a JavaScript/TypeScript library for validating tea recipes.

**Features needed**:
- [ ] Schema validation using JSON Schema
- [ ] TypeScript type definitions
- [ ] Browser and Node.js support
- [ ] ESM and CommonJS modules
- [ ] Error reporting with helpful messages

**Deliverables**:
- npm package
- API documentation
- Usage examples
- Test suite (>90% coverage)
EOF
) \
  --label "enhancement,category: tools,v1.1.x,help wanted" || echo "Issue may already exist"

echo "Creating issue: CLI Recipe Generator..."
gh issue create \
  --title "Create interactive CLI recipe generator" \
  --body-file <(cat <<'EOF'
Build a command-line wizard for creating tea recipes interactively.

**Features**:
- [ ] Interactive prompts for all fields
- [ ] Template selection (simple, intermediate, advanced)
- [ ] Auto-generate recipe ID
- [ ] Validate on creation
- [ ] Save to file

**Example usage**:
```bash
npx create-tea-recipe
tea-recipe-cli create --template simple
```
EOF
) \
  --label "enhancement,category: tools,v1.1.x,priority: medium" || echo "Issue may already exist"

echo "Creating issue: Web Validator..."
gh issue create \
  --title "Build web-based recipe validator and editor" \
  --body-file <(cat <<'EOF'
Create a web application for validating and editing tea recipes.

**Features**:
- [ ] Drag-and-drop JSON file upload
- [ ] Live validation with error highlighting
- [ ] Visual recipe editor (form-based)
- [ ] JSON preview with syntax highlighting
- [ ] Download validated recipe
- [ ] Example recipe gallery

**Technical stack**:
- Static site (Next.js or Astro)
- Monaco editor for JSON editing
- Tailwind CSS for styling
EOF
) \
  --label "enhancement,category: web,v1.1.x,priority: high" || echo "Issue may already exist"

echo "Creating issue: ESP32 Tutorial..."
gh issue create \
  --title "Write comprehensive ESP32/Arduino implementation guide" \
  --body-file <(cat <<'EOF'
Create detailed tutorial for implementing tea recipe support on ESP32/Arduino.

**Content needed**:
- [ ] Hardware requirements and shopping list
- [ ] Circuit diagrams
- [ ] Complete Arduino sketch with comments
- [ ] Recipe parsing example
- [ ] LCD/OLED display code
- [ ] Troubleshooting section

**Deliverables**:
- `docs/guides/ESP32_ARDUINO_GUIDE.md`
- Example code in `examples/platforms/esp32/`
- Wiring diagrams
EOF
) \
  --label "documentation,category: iot,v1.1.x,priority: high,help wanted" || echo "Issue may already exist"

echo "Creating issue: Contributing Guidelines..."
gh issue create \
  --title "Write comprehensive CONTRIBUTING.md" \
  --body-file <(cat <<'EOF'
Create detailed contributing guidelines for the project.

**Sections needed**:
- [ ] Code of Conduct reference
- [ ] How to contribute (issues, PRs, recipes)
- [ ] Development setup
- [ ] Recipe contribution guidelines
- [ ] Testing requirements
- [ ] Documentation standards
- [ ] Review process
EOF
) \
  --label "documentation,v1.1.x,priority: high" || echo "Issue may already exist"

echo "Creating issue: FAQ Documentation..."
gh issue create \
  --title "Create comprehensive FAQ" \
  --body-file <(cat <<'EOF'
Build an FAQ covering common questions and troubleshooting.

**Topics to cover**:
- Why JSON over other formats?
- Which devices are supported?
- How do I validate a recipe?
- How do I create a recipe?
- Integration questions

**File location**: `docs/FAQ.md`
EOF
) \
  --label "documentation,v1.1.x,help wanted,good first issue" || echo "Issue may already exist"

echo "Creating issue: Automated Testing..."
gh issue create \
  --title "Implement automated testing pipeline" \
  --body-file <(cat <<'EOF'
Set up continuous testing for recipes and tools.

**Testing needs**:
- [ ] Schema validation tests
- [ ] Recipe file validation (all examples)
- [ ] Python validator tests
- [ ] Documentation link checking

**CI/CD**:
- GitHub Actions workflow
- Run on every PR
- Run nightly for all recipes
EOF
) \
  --label "enhancement,priority: high" || echo "Issue may already exist"

echo ""
echo "✅ Issues created"
echo ""

echo "🎉 Setup Complete!"
echo "=================="
echo ""
echo "Next steps:"
echo "1. Visit your repository on GitHub"
echo "2. Check Issues tab to see all created issues"
echo "3. Review Milestones for project planning"
echo "4. Start working on issues tagged 'good first issue'"
echo ""
echo "📚 Documentation:"
echo "   - See ROADMAP.md for project vision"
echo "   - See planning/GITHUB_SETUP.md for detailed planning"
echo ""
echo "Happy coding! 🍵"
