# GitHub Project Board Configuration

## Overview

This document describes the recommended GitHub Project Board setup for managing tea-recipes development.

## Board Structure

### Option 1: Simple Kanban Board

**Columns**:
1. **Backlog** - Planned but not started
2. **To Do** - Ready to work on
3. **In Progress** - Currently being worked on
4. **In Review** - PR submitted, awaiting review
5. **Done** - Completed

**Automation**:
- New issues → Backlog
- Issues assigned → To Do
- PR created → In Review
- PR merged → Done

---

### Option 2: Version-Based Board

Create separate boards for each major version:

**v1.1.0 Community & Ecosystem Board**
- Backlog
- Ready
- In Progress
- Review
- Complete

**v1.2.0 Advanced Features Board**
- Research
- Design
- Implementation
- Testing
- Released

---

### Option 3: Feature-Based Board

**Columns by Feature Area**:
1. **Recipes** - New recipes and improvements
2. **Documentation** - Docs, guides, tutorials
3. **Tools** - CLI, validators, converters
4. **Platform Integration** - IoT, mobile, web
5. **Schema** - Schema changes and updates
6. **Community** - Community initiatives

Each column has:
- To Do
- In Progress
- Done

---

## Recommended: Hybrid Approach

Use GitHub Projects (Beta) with custom fields:

### Fields

**Status** (Single Select):
- 📋 Backlog
- 🎯 Ready
- 🚧 In Progress
- 👀 In Review
- ✅ Done
- 🔴 Blocked

**Priority** (Single Select):
- 🔥 Critical
- ⬆️ High
- ➡️ Medium
- ⬇️ Low

**Category** (Multi Select):
- 📝 Recipe
- 📚 Documentation
- 🔧 Tools
- 🤖 IoT
- 📱 Mobile
- 🌐 Web
- 🎨 Design
- 🧪 Testing

**Version** (Single Select):
- v1.0.x
- v1.1.x
- v1.2.x
- v2.0.x
- Ongoing

**Effort** (Single Select):
- 🟢 Small (< 4 hours)
- 🟡 Medium (4-16 hours)
- 🟠 Large (16-40 hours)
- 🔴 X-Large (40+ hours)

**Type** (Single Select):
- 🐛 Bug
- ✨ Feature
- 📖 Documentation
- 🔄 Refactor
- 🧹 Chore

### Views

#### 1. Board View (Default)
Group by: **Status**
Sort by: **Priority**

#### 2. Roadmap View
Layout: **Roadmap**
Group by: **Version**
Date field: **Milestone Due Date**

#### 3. Priority View
Group by: **Priority**
Filter: Status != Done

#### 4. Category View
Group by: **Category**
Sort by: **Priority**

#### 5. Sprint View
Filter: **Current Milestone**
Group by: **Status**

---

## Setup Instructions

### Create Project Board (Classic)

```bash
# Not directly supported via CLI, but you can use gh API
gh api repos/:owner/:repo/projects \
  -X POST \
  -f name="Tea Recipes Development" \
  -f body="Main development board for tea-recipes project"
```

### Create Project Board (Beta)

1. Go to your repository on GitHub
2. Click "Projects" tab
3. Click "New project"
4. Choose "Board" or "Table" template
5. Name it "Tea Recipes Development"
6. Add custom fields as described above

### Automate with GitHub Actions

Create `.github/workflows/project-automation.yml`:

```yaml
name: Project Board Automation

on:
  issues:
    types: [opened, reopened, assigned]
  pull_request:
    types: [opened, review_requested, closed]

jobs:
  automate-project:
    runs-on: ubuntu-latest
    steps:
      - name: Add new issues to board
        if: github.event_name == 'issues' && github.event.action == 'opened'
        run: |
          # Add issue to project board
          # This requires GitHub CLI or API calls

      - name: Move assigned issues to "In Progress"
        if: github.event_name == 'issues' && github.event.action == 'assigned'
        run: |
          # Move issue to "In Progress" column

      - name: Move PRs to "In Review"
        if: github.event_name == 'pull_request' && github.event.action == 'opened'
        run: |
          # Move PR to "In Review" column

      - name: Move merged PRs to "Done"
        if: github.event_name == 'pull_request' && github.event.action == 'closed' && github.event.pull_request.merged
        run: |
          # Move PR to "Done" column
```

---

## Board Maintenance

### Weekly

- [ ] Review Backlog, prioritize top 3-5 issues
- [ ] Check for stalled "In Progress" items
- [ ] Update milestone progress
- [ ] Celebrate completed items

### Monthly

- [ ] Review roadmap alignment
- [ ] Update version milestones
- [ ] Archive completed boards (if version-based)
- [ ] Gather contributor feedback

### Quarterly

- [ ] Comprehensive roadmap review
- [ ] Adjust priorities based on community feedback
- [ ] Update long-term vision
- [ ] Plan next quarter initiatives

---

## Labels Strategy

### Label Organization

**Type Labels** (What):
- bug
- enhancement
- documentation
- recipe
- schema

**Category Labels** (Where):
- category: iot
- category: mobile
- category: web
- category: tools

**Priority Labels** (When):
- priority: critical
- priority: high
- priority: medium
- priority: low

**Status Labels** (How):
- good first issue
- help wanted
- contribution
- blocked

**Version Labels** (Which):
- v1.0.x
- v1.1.x
- v1.2.x
- v2.0.x

### Label Usage Guidelines

1. **Every issue should have**:
   - At least one Type label
   - At least one Version label
   - A Priority label (if urgent)

2. **Use Category labels** for:
   - Issues specific to a platform
   - Cross-functional work

3. **Use Status labels** for:
   - Community engagement
   - Contributor guidance

---

## Metrics & Tracking

### Key Metrics

1. **Velocity**
   - Issues closed per week/month
   - Average time to close

2. **Health**
   - Issue response time
   - PR review time
   - Stale issue count

3. **Community**
   - New contributors
   - Recipe contributions
   - Community engagement

4. **Quality**
   - Bug count vs. features
   - Documentation coverage
   - Test coverage

### Tracking Tools

- GitHub Insights
- Project Board progress
- Milestone completion percentage
- Custom dashboards (optional)

---

## Tips for Success

1. **Keep it Simple**: Start with basic Kanban, expand as needed
2. **Regular Updates**: Keep board current, move cards frequently
3. **Clear Descriptions**: Every card should have clear acceptance criteria
4. **Time-box**: Estimate effort, don't let cards sit too long
5. **Celebrate**: Highlight completed work and contributors
6. **Iterate**: Adjust board structure based on what works

---

## Resources

- [GitHub Projects Documentation](https://docs.github.com/en/issues/planning-and-tracking-with-projects)
- [Automating Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/automating-your-project)
- [Best Practices](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/best-practices-for-projects)

---

**Next Steps**:
1. Create your project board
2. Add existing issues
3. Set up automation
4. Start tracking progress!
