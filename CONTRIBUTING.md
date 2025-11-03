# Contributing to BibleMacs

First off, thank you for considering contributing to BibleMacs! It's people like you that make BibleMacs such a great tool for Bible study.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
  - [Reporting Bugs](#reporting-bugs)
  - [Suggesting Features](#suggesting-features)
  - [Adding Bible Translations](#adding-bible-translations)
  - [Improving Documentation](#improving-documentation)
  - [Contributing Code](#contributing-code)
- [Development Setup](#development-setup)
- [Style Guides](#style-guides)
  - [Emacs Lisp Style](#emacs-lisp-style)
  - [Git Commit Messages](#git-commit-messages)
  - [Documentation Style](#documentation-style)
- [Pull Request Process](#pull-request-process)

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code. Please be respectful and considerate in all interactions.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues as you might find out that you don't need to create one. When you are creating a bug report, please include as many details as possible:

**Bug Report Template:**

```markdown
**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Press '...'
2. Type '...'
3. See error

**Expected behavior**
What you expected to happen.

**Environment:**
- OS: [e.g., Ubuntu 22.04, macOS 13]
- Emacs version: [e.g., 28.2]
- BibleMacs version/commit: [e.g., v1.0.0 or commit hash]

**Additional context**
Any other context about the problem.

**Error messages**
```
Paste any error messages here
```
```

### Suggesting Features

Feature suggestions are tracked as GitHub issues. Before creating enhancement suggestions, please check the existing issues and discussions.

**Feature Request Template:**

```markdown
**Is your feature request related to a problem?**
A clear description of the problem.

**Describe the solution you'd like**
A clear description of what you want to happen.

**Describe alternatives you've considered**
Any alternative solutions or features you've considered.

**Additional context**
Any other context or screenshots about the feature request.
```

### Adding Bible Translations

#### Guidelines for Bible Texts

1. **Verify Copyright Status**
   - Only add public domain or freely licensed translations
   - Include copyright information in the file header
   - Do not add copyrighted translations without permission

2. **File Format**
   - Follow the format specified in `bible/README.md`
   - One `.org` file per book
   - Consistent verse numbering and formatting

3. **Testing**
   - Ensure the files work with BibleMacs search and navigation
   - Test cross-references if included
   - Verify special characters display correctly

#### Submitting Bible Files

```bash
# Create a new branch
git checkout -b bible/translation-name

# Add your Bible files
cp your-bible-files/*.org bible/

# Add a README for your translation
echo "Translation information" > bible/YOUR_TRANSLATION_README.md

# Commit with clear message
git commit -m "Add: [Translation Name] Bible translation (public domain)"

# Push and create PR
git push origin bible/translation-name
```

### Improving Documentation

Documentation improvements are always welcome! This includes:

- Fixing typos and grammar
- Clarifying existing documentation
- Adding examples
- Translating documentation
- Creating video tutorials

### Contributing Code

#### Areas We Need Help

- **Conversion Scripts**: Tools to convert various Bible formats to .org
- **Study Methods**: Additional study method templates
- **UI Enhancements**: Themes, dashboard improvements
- **Search Features**: Enhanced search capabilities
- **Export Options**: Additional publishing formats
- **Performance**: Optimization for large Bible collections

## Development Setup

### Prerequisites

```bash
# Install development dependencies
sudo apt-get install git emacs ripgrep fd-find  # Ubuntu/Debian
brew install git emacs ripgrep fd                # macOS
```

### Setting Up Development Environment

```bash
# Fork the repository on GitHub

# Clone your fork
git clone https://github.com/YOUR_USERNAME/biblemacs.git
cd biblemacs

# Add upstream remote
git remote add upstream https://github.com/ORIGINAL_OWNER/biblemacs.git

# Create a development branch
git checkout -b feature/your-feature-name

# Install BibleMacs for development
./setup.sh
```

### Testing Your Changes

```bash
# Test configuration loading
emacs --batch -l config/init.org

# Run with your changes
emacs

# Test specific functions
emacs --batch --eval "(progn (load-file \"config/init.org\") (biblemacs-test-function))"
```

## Style Guides

### Emacs Lisp Style

- Use descriptive variable and function names
- Prefix all functions with `biblemacs-`
- Include docstrings for all functions
- Follow standard Emacs Lisp conventions

```elisp
(defun biblemacs-example-function (arg)
  "Brief description of what the function does.
ARG is described here."
  (interactive "sEnter value: ")
  ;; Function body
  )
```

### Git Commit Messages

Format: `<type>: <subject>`

Types:
- `Add:` New feature
- `Fix:` Bug fix
- `Update:` Update existing functionality
- `Remove:` Remove feature or file
- `Refactor:` Code refactoring
- `Doc:` Documentation only
- `Style:` Code style changes
- `Test:` Adding tests

Examples:
```
Add: Implement original language study tools
Fix: Correct verse linking in cross-references
Update: Improve search performance for large Bibles
Doc: Add installation guide for Windows
```

### Documentation Style

- Write in clear, simple English
- Include examples where helpful
- Use Org-mode formatting for .org files
- Keep lines under 80 characters when possible
- Add screenshots for UI features

## Pull Request Process

1. **Ensure your code follows the style guides**

2. **Update documentation**
   - Update README.md if needed
   - Add yourself to CONTRIBUTORS.md
   - Document new features in appropriate guides

3. **Test your changes**
   ```bash
   # Run basic tests
   make test  # If Makefile exists
   
   # Or manually test
   emacs --batch -l config/init.org
   ```

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "Add: Your feature description"
   ```

5. **Keep your fork updated**
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

6. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

7. **Create Pull Request**
   - Go to your fork on GitHub
   - Click "New Pull Request"
   - Provide clear description of changes
   - Reference any related issues

8. **PR Review Process**
   - Maintainers will review your code
   - Address any feedback
   - Once approved, it will be merged

### Pull Request Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Performance improvement
- [ ] Code refactoring

## Testing
- [ ] Tested on Linux
- [ ] Tested on macOS
- [ ] Tested on Windows
- [ ] Added tests

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No new warnings
- [ ] Changes are backward compatible

## Related Issues
Closes #issue_number
```

## Questions?

Feel free to:
- Open an issue for questions
- Start a discussion in GitHub Discussions
- Contact maintainers directly

## Recognition

Contributors will be recognized in:
- CONTRIBUTORS.md file
- Release notes
- Project documentation

Thank you for contributing to BibleMacs! 🙏
