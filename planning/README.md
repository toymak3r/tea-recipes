# Tea Recipes - Project Planning

This directory contains comprehensive project planning documentation, GitHub setup scripts, and roadmap information.

## Contents

### 📋 [GITHUB_SETUP.md](GITHUB_SETUP.md)
Complete guide for setting up GitHub project management, including:
- **Labels**: 20+ labels for issue categorization
- **Milestones**: Version-based milestones (v1.1.0, v1.2.0, v2.0.0)
- **Issues**: 21 pre-written issues with detailed descriptions

All commands are copy-paste ready for quick setup.

### 🚀 [../ROADMAP.md](../ROADMAP.md)
Project roadmap covering:
- **v1.0.0**: Foundation Release (Current) ✅
- **v1.1.0**: Community & Ecosystem (Q1 2026) 🎯
- **v1.2.0**: Advanced Features (Q2 2026) 📋
- **v2.0.0**: Next Generation (Q4 2026) 🚀

Includes vision, goals, features, and success metrics for each version.

### 🛠️ [setup-github-project.sh](setup-github-project.sh)
Automated shell script to:
- Create all labels
- Set up milestones
- Generate issues
- Configure project structure

**Usage**:
```bash
cd planning
./setup-github-project.sh
```

**Requirements**:
- GitHub CLI (`gh`) installed
- Authenticated with GitHub
- Write access to repository

### 📊 [PROJECT_BOARD_CONFIG.md](PROJECT_BOARD_CONFIG.md)
GitHub Project Board configuration guide with:
- Board structure recommendations
- Custom field definitions
- View configurations
- Automation strategies
- Maintenance schedules

Three approaches covered:
1. Simple Kanban
2. Version-Based Boards
3. Feature-Based Boards

Plus recommended hybrid approach with custom fields.

## Quick Start

### 1. Review the Roadmap
```bash
cat ../ROADMAP.md
```

### 2. Set Up GitHub Project
```bash
# Install GitHub CLI if needed
# macOS: brew install gh
# Linux: See https://cli.github.com/

# Authenticate
gh auth login

# Run setup script
cd planning
./setup-github-project.sh
```

### 3. Create Project Board

1. Go to your GitHub repository
2. Click "Projects" tab
3. Create new project (Board or Table)
4. Configure custom fields (see PROJECT_BOARD_CONFIG.md)
5. Add automation rules

### 4. Start Contributing

Check issues tagged with:
- `good first issue` - Great for newcomers
- `help wanted` - Community help needed
- `v1.1.x` - Current version work

## Project Structure

```
tea-recipes/
├── planning/
│   ├── README.md (this file)
│   ├── GITHUB_SETUP.md
│   ├── PROJECT_BOARD_CONFIG.md
│   └── setup-github-project.sh
├── ROADMAP.md
├── .github/
│   └── ISSUE_TEMPLATE/
│       ├── bug_report.md
│       ├── feature_request.md
│       └── recipe_contribution.md
└── ... (other project files)
```

## Contributing to Planning

Have suggestions for the roadmap or project structure?

1. Open a [Discussion](https://github.com/toymak3r/tea-recipes/discussions)
2. File a [Feature Request](https://github.com/toymak3r/tea-recipes/issues/new?template=feature_request.md)
3. Submit a PR with roadmap updates

## Version Timeline

| Version | Status | Target | Focus |
|---------|--------|--------|-------|
| v1.0.0 | ✅ Released | Jan 2026 | Foundation & Core Schema |
| v1.1.0 | 🎯 In Planning | Mar 2026 | Community & Ecosystem |
| v1.2.0 | 📋 Planned | Jun 2026 | Advanced Features |
| v2.0.0 | 🚀 Future | Dec 2026 | Next Generation |

## Key Initiatives

### v1.1.0 Focus Areas

1. **Recipe Library** (3 issues)
   - Chinese tea recipes
   - Cold brew recipes
   - Regional collections

2. **Developer Tools** (4 issues)
   - JavaScript validator
   - CLI recipe generator
   - Web validator
   - Format converter

3. **Platform Guides** (3 issues)
   - ESP32/Arduino tutorial
   - React Native template
   - Home Assistant integration

4. **Documentation** (3 issues)
   - Contributing guidelines
   - FAQ
   - Video tutorials

5. **Community** (2 issues)
   - Recipe showcase website
   - Monthly contests

### Ongoing

- Automated testing
- Performance benchmarks
- Security audits

## Resources

### External Links

- [GitHub Projects Docs](https://docs.github.com/en/issues/planning-and-tracking-with-projects)
- [GitHub CLI](https://cli.github.com/)
- [Semantic Versioning](https://semver.org/)
- [Conventional Commits](https://www.conventionalcommits.org/)

### Internal Documentation

- [FORMAT_SPECIFICATION.md](../FORMAT_SPECIFICATION.md) - Technical spec
- [QUICK_REFERENCE.md](../QUICK_REFERENCE.md) - Quick reference
- [CONTRIBUTING.md](../CONTRIBUTING.md) - Contributing guide (to be created)

## Metrics

Track project health with:

- **Issue velocity**: Issues closed per week
- **Response time**: Time to first response on issues
- **PR throughput**: PRs merged per week
- **Community growth**: New contributors per month
- **Recipe count**: Total recipes in library
- **Device implementations**: Confirmed working devices

## Contact

Questions about project planning?

- 💬 Open a [Discussion](https://github.com/toymak3r/tea-recipes/discussions)
- 📧 Contact maintainers via GitHub
- 🐛 File an issue for problems with planning docs

---

**Last Updated**: January 2026
**Maintained By**: Project maintainers and community
