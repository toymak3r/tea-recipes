# GitHub Project Setup Guide

This document contains all the commands and planning needed to set up the GitHub project management for tea-recipes.

## Labels

Create the following labels for issue categorization:

```bash
# Core Labels
gh label create "bug" --description "Something isn't working" --color "d73a4a"
gh label create "enhancement" --description "New feature or request" --color "a2eeef"
gh label create "documentation" --description "Improvements or additions to documentation" --color "0075ca"
gh label create "recipe" --description "New recipe or recipe improvements" --color "7057ff"
gh label create "schema" --description "Schema changes or additions" --color "d4c5f9"

# Priority Labels
gh label create "priority: critical" --description "Critical priority" --color "b60205"
gh label create "priority: high" --description "High priority" --color "d93f0b"
gh label create "priority: medium" --description "Medium priority" --color "fbca04"
gh label create "priority: low" --description "Low priority" --color "0e8a16"

# Category Labels
gh label create "category: iot" --description "IoT device related" --color "1d76db"
gh label create "category: mobile" --description "Mobile app related" --color "5319e7"
gh label create "category: web" --description "Web application related" --color "006b75"
gh label create "category: tools" --description "Developer tools" --color "bfd4f2"

# Status Labels
gh label create "good first issue" --description "Good for newcomers" --color "7057ff"
gh label create "help wanted" --description "Extra attention is needed" --color "008672"
gh label create "contribution" --description "Community contribution" --color "eb6420"
gh label create "wontfix" --description "This will not be worked on" --color "ffffff"
gh label create "duplicate" --description "This issue or pull request already exists" --color "cfd3d7"
gh label create "question" --description "Further information is requested" --color "d876e3"

# Version Labels
gh label create "v1.0.x" --description "Version 1.0.x" --color "c2e0c6"
gh label create "v1.1.x" --description "Version 1.1.x" --color "c2e0c6"
gh label create "v1.2.x" --description "Version 1.2.x" --color "c2e0c6"
gh label create "v2.0.x" --description "Version 2.0.x" --color "c2e0c6"
```

## Milestones

Create milestones for version planning:

```bash
# v1.0.0 - Foundation Release (Completed)
gh milestone create "v1.0.0 Foundation" \
  --description "Initial release with core schema, documentation, and example recipes" \
  --due-date "2026-01-15"

# v1.1.0 - Community & Ecosystem
gh milestone create "v1.1.0 Community & Ecosystem" \
  --description "Community tools, expanded recipe library, platform guides, and developer resources" \
  --due-date "2026-03-31"

# v1.2.0 - Advanced Features
gh milestone create "v1.2.0 Advanced Features" \
  --description "Multi-language support, resteeping instructions, water quality parameters, and enhanced metadata" \
  --due-date "2026-06-30"

# v2.0.0 - Next Generation
gh milestone create "v2.0.0 Next Generation" \
  --description "AI/ML integration, voice assistants, smart device ecosystem, and major enhancements" \
  --due-date "2026-12-31"

# Ongoing
gh milestone create "Ongoing Maintenance" \
  --description "Continuous improvements, bug fixes, and documentation updates"
```

## Issues for v1.1.0

### Recipe Library Expansion

```bash
# Issue 1: Add Chinese Tea Recipes
gh issue create \
  --title "Add traditional Chinese tea recipes (Longjing, Tieguanyin, Pu-erh)" \
  --body "Add authentic Chinese tea recipes to the examples directory.

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

**References**:
- Traditional Chinese tea preparation methods
- Professional tea master recommendations" \
  --label "recipe,v1.1.x,help wanted,good first issue" \
  --milestone "v1.1.0 Community & Ecosystem"

# Issue 2: Add Cold Brew Recipes
gh issue create \
  --title "Create cold brew tea recipes" \
  --body "Add cold brew recipes for popular tea types.

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

**Schema compatibility**: Should work with existing v1.0.0 schema" \
  --label "recipe,enhancement,v1.1.x" \
  --milestone "v1.1.0 Community & Ecosystem"

# Issue 3: Regional Recipe Collection
gh issue create \
  --title "Build comprehensive regional recipe collection" \
  --body "Create recipe collections representing major tea-drinking cultures.

**Regions to cover**:
- [ ] Japanese (Matcha ceremony, Hojicha, Genmaicha)
- [ ] Indian (Assam, Darjeeling, regional Chai variations)
- [ ] British (Afternoon tea, Breakfast tea)
- [ ] Moroccan (Mint tea)
- [ ] Turkish (Çay)
- [ ] Russian (Zavarka style)
- [ ] Thai (Thai iced tea)
- [ ] Taiwanese (Bubble tea, High mountain oolong)

**Requirements**:
- Authentic preparation methods
- Cultural context in metadata
- Regional tags
- Difficulty ratings

**Estimated**: 15-20 recipes total" \
  --label "recipe,documentation,v1.1.x,help wanted" \
  --milestone "v1.1.0 Community & Ecosystem"
```

### Developer Tools

```bash
# Issue 4: JavaScript/TypeScript Validator
gh issue create \
  --title "Create JavaScript/TypeScript validation library" \
  --body "Build a JavaScript/TypeScript library for validating tea recipes.

**Features needed**:
- [ ] Schema validation using JSON Schema
- [ ] TypeScript type definitions
- [ ] Browser and Node.js support
- [ ] ESM and CommonJS modules
- [ ] Error reporting with helpful messages
- [ ] Recipe normalization utilities

**Technical stack**:
- ajv for JSON Schema validation
- TypeScript for type safety
- Bundled with rollup/esbuild
- Zero runtime dependencies (peer deps ok)

**Deliverables**:
- npm package
- API documentation
- Usage examples
- Test suite (>90% coverage)

**File location**: \`tools/js-validator/\`" \
  --label "enhancement,category: tools,v1.1.x,help wanted" \
  --milestone "v1.1.0 Community & Ecosystem"

# Issue 5: CLI Recipe Generator
gh issue create \
  --title "Create interactive CLI recipe generator" \
  --body "Build a command-line wizard for creating tea recipes interactively.

**Features**:
- [ ] Interactive prompts for all fields
- [ ] Template selection (simple, intermediate, advanced)
- [ ] Auto-generate recipe ID
- [ ] Validate on creation
- [ ] Save to file
- [ ] Support for editing existing recipes

**Technical approach**:
- Use inquirer.js for prompts
- Node.js CLI tool
- Colorful terminal output (chalk)
- ASCII art/branding

**Example usage**:
\`\`\`bash
npx create-tea-recipe
# or
tea-recipe-cli create --template simple
tea-recipe-cli validate my-recipe.json
tea-recipe-cli edit examples/sencha.json
\`\`\`

**Deliverables**:
- CLI tool (\`tools/cli/\`)
- npm package
- README with usage
- Demo GIF" \
  --label "enhancement,category: tools,v1.1.x,priority: medium" \
  --milestone "v1.1.0 Community & Ecosystem"

# Issue 6: Online Recipe Validator
gh issue create \
  --title "Build web-based recipe validator and editor" \
  --body "Create a web application for validating and editing tea recipes.

**Features**:
- [ ] Drag-and-drop JSON file upload
- [ ] Live validation with error highlighting
- [ ] Visual recipe editor (form-based)
- [ ] JSON preview with syntax highlighting
- [ ] Download validated recipe
- [ ] Share recipe via URL
- [ ] Example recipe gallery

**Technical stack**:
- Static site (Next.js or Astro)
- Monaco editor for JSON editing
- ajv for validation
- Tailwind CSS for styling
- Deploy to GitHub Pages or Vercel

**URL**: https://tea-recipes.org/validator

**Deliverables**:
- Web application
- Responsive design
- Deployment pipeline" \
  --label "enhancement,category: web,v1.1.x,priority: high" \
  --milestone "v1.1.0 Community & Ecosystem"

# Issue 7: Recipe Format Converter
gh issue create \
  --title "Create format converter for legacy/alternative formats" \
  --body "Build utilities to convert between tea recipe format v1.0.0 and other common formats.

**Target formats**:
- [ ] Markdown (human-readable)
- [ ] YAML (alternative serialization)
- [ ] CSV (spreadsheet import/export)
- [ ] Plain text (print-friendly)
- [ ] HTML (web display)
- [ ] PDF (printing)

**Features**:
- Bidirectional conversion where possible
- Preserve all metadata
- Lossy conversion warnings
- Batch conversion support
- CLI and library API

**Example usage**:
\`\`\`bash
tea-convert --from json --to markdown recipe.json
tea-convert --from yaml --to json recipes/*.yaml --out ./json/
\`\`\`

**File location**: \`tools/converters/\`" \
  --label "enhancement,category: tools,v1.1.x,help wanted" \
  --milestone "v1.1.0 Community & Ecosystem"
```

### Platform Guides

```bash
# Issue 8: ESP32/Arduino Tutorial
gh issue create \
  --title "Write comprehensive ESP32/Arduino implementation guide" \
  --body "Create detailed tutorial for implementing tea recipe support on ESP32/Arduino.

**Content needed**:
- [ ] Hardware requirements and shopping list
- [ ] Circuit diagrams (temperature sensor, display, buttons)
- [ ] Complete Arduino sketch with comments
- [ ] Library dependencies (ArduinoJson, etc.)
- [ ] Recipe parsing example
- [ ] Brewing state machine implementation
- [ ] LCD/OLED display code
- [ ] Serial debugging guide
- [ ] Troubleshooting section

**Hardware platforms**:
- ESP32 DevKit
- Arduino Uno/Mega
- Raspberry Pi Pico W

**Deliverables**:
- \`docs/guides/ESP32_ARDUINO_GUIDE.md\`
- Example code in \`examples/platforms/esp32/\`
- Wiring diagrams (Fritzing)
- Demo video

**Estimated effort**: 20-30 hours" \
  --label "documentation,category: iot,v1.1.x,priority: high,help wanted" \
  --milestone "v1.1.0 Community & Ecosystem"

# Issue 9: React Native Mobile App Template
gh issue create \
  --title "Create React Native mobile app starter template" \
  --body "Build a starter template for tea timer mobile apps using React Native.

**Features**:
- [ ] Recipe browser/library
- [ ] Recipe detail view
- [ ] Brewing timer with notifications
- [ ] Step-by-step brewing guide
- [ ] Temperature converter
- [ ] Recipe search and filter
- [ ] Favorites/bookmarks
- [ ] Dark mode support

**Technical stack**:
- React Native (Expo)
- TypeScript
- React Navigation
- AsyncStorage for local recipes
- Push notifications
- Haptic feedback

**Deliverables**:
- \`examples/platforms/mobile-app/\`
- README with setup instructions
- App store screenshots
- Demo on iOS and Android

**Stretch goals**:
- Recipe import via QR code
- Cloud sync
- Community recipe sharing" \
  --label "enhancement,category: mobile,v1.1.x,help wanted" \
  --milestone "v1.1.0 Community & Ecosystem"

# Issue 10: Home Assistant Integration Guide
gh issue create \
  --title "Create Home Assistant integration guide" \
  --body "Document how to integrate tea recipes with Home Assistant.

**Content**:
- [ ] Custom component setup
- [ ] Recipe entity creation
- [ ] Automation examples
- [ ] Lovelace UI cards
- [ ] Notification setup
- [ ] Voice assistant integration (Alexa, Google Home)

**Example automations**:
- Morning tea reminder
- Optimal brewing temperature alerts
- Multi-step brewing sequence
- Integration with smart kettle/thermostat

**Deliverables**:
- \`docs/guides/HOME_ASSISTANT_GUIDE.md\`
- Example configuration files
- Custom Lovelace card (optional)

**Target audience**: Home automation enthusiasts" \
  --label "documentation,category: iot,v1.1.x,help wanted" \
  --milestone "v1.1.0 Community & Ecosystem"
```

### Documentation Improvements

```bash
# Issue 11: Contributing Guidelines
gh issue create \
  --title "Write comprehensive CONTRIBUTING.md" \
  --body "Create detailed contributing guidelines for the project.

**Sections needed**:
- [ ] Code of Conduct reference
- [ ] How to contribute (issues, PRs, recipes)
- [ ] Development setup
- [ ] Recipe contribution guidelines
- [ ] Code style and formatting
- [ ] Testing requirements
- [ ] Documentation standards
- [ ] Review process
- [ ] Recognition/attribution

**Inspiration**:
- Check popular open source projects
- Make it welcoming for first-time contributors
- Include examples

**File**: \`CONTRIBUTING.md\`" \
  --label "documentation,v1.1.x,priority: high" \
  --milestone "v1.1.0 Community & Ecosystem"

# Issue 12: FAQ Documentation
gh issue create \
  --title "Create comprehensive FAQ" \
  --body "Build an FAQ covering common questions and troubleshooting.

**Topics to cover**:

**General**:
- Why JSON over other formats?
- Which devices are supported?
- How do I validate a recipe?
- Can I use this commercially?

**Technical**:
- How do I handle parsing errors?
- What if my device doesn't support all features?
- How precise do temperatures need to be?
- How do I handle temperature conversion?

**Recipe Creation**:
- How do I create a recipe?
- What's the difference between steep and wait?
- How do I handle optional ingredients?
- Can I have multiple brewing methods for one tea?

**Integration**:
- How do I integrate with my IoT device?
- Can I use this with Homebridge?
- Does this work with voice assistants?

**File location**: \`docs/FAQ.md\`" \
  --label "documentation,v1.1.x,help wanted,good first issue" \
  --milestone "v1.1.0 Community & Ecosystem"

# Issue 13: Video Tutorial Series
gh issue create \
  --title "Create video tutorial series" \
  --body "Produce video tutorials for key use cases.

**Planned videos** (5-10 min each):

1. **Introduction to Tea Recipe Format**
   - Overview and benefits
   - Schema walkthrough
   - Example recipes

2. **Creating Your First Recipe**
   - Using the CLI tool
   - Validation
   - Testing

3. **IoT Device Integration**
   - ESP32 example
   - Parsing recipes
   - Controlling brewing

4. **Mobile App Development**
   - React Native template tour
   - Customization
   - Publishing

5. **Web Integration**
   - Recipe display
   - Interactive brewing timer
   - User interface design

**Technical requirements**:
- Screen recording with voiceover
- 1080p quality
- Captions/subtitles
- Upload to YouTube
- Embed in documentation

**Deliverables**:
- 5 videos
- YouTube playlist
- Updated docs with video embeds" \
  --label "documentation,v1.1.x,priority: medium" \
  --milestone "v1.1.0 Community & Ecosystem"
```

### Community Features

```bash
# Issue 14: Recipe Showcase Website
gh issue create \
  --title "Build community recipe showcase website" \
  --body "Create a website to showcase community-contributed recipes.

**Features**:
- [ ] Browse all recipes
- [ ] Filter by tea type, difficulty, tags
- [ ] Recipe detail pages
- [ ] Search functionality
- [ ] Submit recipe (GitHub PR workflow)
- [ ] Featured recipes section
- [ ] Recently added recipes
- [ ] Recipe of the week

**Technical approach**:
- Static site generator (Astro, 11ty, or Next.js)
- MDX for recipe pages
- Algolia or Fuse.js for search
- GitHub Actions for automated builds
- Deploy to Netlify/Vercel

**URL**: https://tea-recipes.org or https://recipes.tea-recipes.org

**Design**:
- Clean, minimal UI
- Mobile-friendly
- Fast loading
- Accessibility (WCAG AA)

**Deliverables**:
- Website (\`website/\` directory)
- Deployment pipeline
- Content management workflow" \
  --label "enhancement,category: web,v1.1.x,priority: high" \
  --milestone "v1.1.0 Community & Ecosystem"

# Issue 15: Monthly Recipe Contest
gh issue create \
  --title "Launch monthly recipe contest program" \
  --body "Establish a monthly contest to encourage recipe contributions.

**Program details**:

**Schedule**:
- Monthly themes (e.g., \"Summer Refreshers\", \"Cozy Winter Teas\")
- Submissions open first 3 weeks of month
- Community voting in final week
- Winners announced first of next month

**Prizes/Recognition**:
- Feature on website homepage
- Social media spotlight
- Contributor badge
- Hall of fame page

**Categories**:
- Best beginner recipe
- Most creative recipe
- Best traditional recipe
- Most innovative use of technology

**Implementation**:
- GitHub Discussions for submissions
- GitHub reactions for voting
- Automated announcements

**Tasks**:
- [ ] Create contest rules
- [ ] Design badges
- [ ] Set up submission workflow
- [ ] Create announcement templates
- [ ] Launch first contest

**File location**: \`docs/community/MONTHLY_CONTESTS.md\`" \
  --label "community,v1.1.x,priority: medium" \
  --milestone "v1.1.0 Community & Ecosystem"
```

## Issues for v1.2.0

```bash
# Issue 16: Multi-language Support (i18n)
gh issue create \
  --title "Add internationalization support to schema" \
  --body "Implement multi-language support for recipe names, descriptions, and instructions.

**Proposed schema changes**:

\`\`\`json
{
  \"name\": {
    \"en\": \"Green Tea\",
    \"zh\": \"绿茶\",
    \"ja\": \"緑茶\",
    \"es\": \"Té Verde\",
    \"fr\": \"Thé Vert\"
  },
  \"description\": {
    \"en\": \"A refreshing...\",
    \"zh\": \"一种清爽的...\"
  }
}
\`\`\`

**Requirements**:
- Backward compatible with v1.0.0
- Default language fallback
- ISO 639-1 language codes
- Update schema to v1.2.0
- Update validation tools
- Create migration guide

**Languages to support initially**:
- English (en)
- Chinese (zh)
- Japanese (ja)
- Spanish (es)
- French (fr)
- German (de)
- Arabic (ar)
- Hindi (hi)

**Deliverables**:
- Updated schema
- Migration guide
- Example recipes in multiple languages
- Updated validation tools" \
  --label "enhancement,schema,v1.2.x,priority: high" \
  --milestone "v1.2.0 Advanced Features"

# Issue 17: Resteeping Instructions
gh issue create \
  --title "Add resteeping capability to schema" \
  --body "Support multiple steeps for teas like oolong and pu-erh.

**Proposed schema addition**:

\`\`\`json
{
  \"resteepCapability\": {
    \"supported\": true,
    \"maxSteeps\": 5,
    \"steeps\": [
      {
        \"steepNumber\": 1,
        \"temperature\": {\"value\": 95, \"unit\": \"celsius\"},
        \"duration\": {\"value\": 30, \"unit\": \"seconds\"}
      },
      {
        \"steepNumber\": 2,
        \"temperature\": {\"value\": 95, \"unit\": \"celsius\"},
        \"duration\": {\"value\": 45, \"unit\": \"seconds\"}
      }
    ],
    \"increasePerSteep\": {\"value\": 15, \"unit\": \"seconds\"}
  }
}
\`\`\`

**Use cases**:
- Traditional gongfu tea ceremony
- Oolong tea appreciation
- Pu-erh tea brewing
- Cost-effective brewing

**Implementation**:
- Schema changes
- Example recipes
- Documentation
- Device implementation guidance" \
  --label "enhancement,schema,v1.2.x,priority: medium" \
  --milestone "v1.2.0 Advanced Features"

# Issue 18: Water Quality Parameters
gh issue create \
  --title "Add water quality specifications to schema" \
  --body "Include water quality parameters for optimal brewing.

**Proposed addition**:

\`\`\`json
{
  \"waterRequirements\": {
    \"tds\": {
      \"min\": 50,
      \"max\": 150,
      \"unit\": \"ppm\",
      \"optimal\": 100
    },
    \"ph\": {
      \"min\": 6.5,
      \"max\": 7.5,
      \"optimal\": 7.0
    },
    \"hardness\": \"soft\",
    \"filtered\": true,
    \"notes\": \"Use spring water or filtered tap water\"
  }
}
\`\`\`

**Research needed**:
- Impact of water hardness on tea
- TDS ranges for different tea types
- pH preferences
- Water treatment recommendations

**Deliverables**:
- Schema update
- Research documentation
- Updated recipes with water specs
- Testing guidelines for device makers" \
  --label "enhancement,schema,v1.2.x,priority: low" \
  --milestone "v1.2.0 Advanced Features"
```

## Issues for Ongoing Maintenance

```bash
# Issue 19: Set up automated testing
gh issue create \
  --title "Implement automated testing pipeline" \
  --body "Set up continuous testing for recipes and tools.

**Testing needs**:
- [ ] Schema validation tests
- [ ] Recipe file validation (all examples)
- [ ] Python validator tests
- [ ] JS/TS validator tests (when available)
- [ ] Documentation link checking
- [ ] JSON formatting validation

**CI/CD**:
- GitHub Actions workflow
- Run on every PR
- Run nightly for all recipes
- Automated reports

**Tools**:
- pytest for Python
- jest for JavaScript
- ajv-cli for schema validation
- markdown-link-check for docs

**File location**: \`.github/workflows/test.yml\`" \
  --label "enhancement,priority: high" \
  --milestone "Ongoing Maintenance"

# Issue 20: Performance benchmarks
gh issue create \
  --title "Create performance benchmarks for parsers" \
  --body "Benchmark JSON parsing performance across platforms.

**Platforms to test**:
- ESP32 (ArduinoJson)
- Arduino Mega (ArduinoJson)
- Raspberry Pi (Python, C, Node.js)
- Desktop (Python, Node.js, Rust)
- Mobile (React Native)

**Metrics**:
- Parse time
- Memory usage
- Energy consumption (for battery devices)
- File size impact

**Test recipes**:
- Simple (5 steps)
- Medium (10 steps)
- Complex (20 steps)
- Large (50+ steps)

**Deliverables**:
- Benchmark suite
- Results documentation
- Optimization recommendations
- Platform compatibility matrix

**File location**: \`benchmarks/\`" \
  --label "enhancement,category: iot,priority: low" \
  --milestone "Ongoing Maintenance"

# Issue 21: Security audit
gh issue create \
  --title "Conduct security audit of schema and tools" \
  --body "Perform comprehensive security review.

**Areas to review**:
- [ ] JSON injection vulnerabilities
- [ ] DoS via large files
- [ ] Parser exploits
- [ ] Validation bypass
- [ ] Schema vulnerabilities
- [ ] Tool dependencies

**Actions**:
- Static code analysis
- Dependency scanning
- Fuzzing test
- Penetration testing
- Security documentation

**Deliverables**:
- Security audit report
- SECURITY.md policy
- Vulnerability disclosure process
- Mitigation recommendations

**Tools**:
- Dependabot
- Snyk
- OWASP ZAP
- Bandit (Python)
- ESLint security plugins" \
  --label "enhancement,priority: high" \
  --milestone "Ongoing Maintenance"
```

## Summary

**Total Issues Created**: 21

**By Milestone**:
- v1.0.0: 0 (already released)
- v1.1.0: 15 issues
- v1.2.0: 3 issues
- v2.0.0: 0 (to be defined)
- Ongoing: 3 issues

**By Label**:
- recipe: 3
- enhancement: 11
- documentation: 7
- schema: 3
- tools: 4
- iot: 4
- mobile: 1
- web: 3

**Priority Breakdown**:
- Critical: 0
- High: 7
- Medium: 4
- Low: 2
- Unassigned: 8

Run all commands in this file to fully set up the GitHub project!
