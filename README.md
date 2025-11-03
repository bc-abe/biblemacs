# BibleMacs - Emacs for Bible Study 📖

<div align="center">

![BibleMacs Banner](https://img.shields.io/badge/BibleMacs-Emacs%20for%20Bible%20Study-blue?style=for-the-badge)

[![Emacs](https://img.shields.io/badge/Emacs-27%2B-blueviolet.svg?style=flat-square)](https://www.gnu.org/software/emacs/)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg?style=flat-square)](https://www.gnu.org/licenses/gpl-3.0)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg?style=flat-square)](https://github.com/yourusername/biblemacs/graphs/commit-activity)

**A complete Emacs distribution for Bible study, note-taking, and theological research**

[Features](#-features) • [Installation](#-installation) • [Quick Start](#-quick-start) • [Documentation](#-documentation) • [Contributing](#-contributing)

</div>

---

## 🎯 Why BibleMacs?

BibleMacs transforms Emacs into a powerful, integrated Bible study environment. Whether you're a pastor preparing sermons, a student researching theology, or someone who wants to deepen their personal Bible study, BibleMacs provides the tools you need in a distraction-free, keyboard-driven interface.

### What makes BibleMacs special?

- 📚 **Integrated Bible Library** - Multiple translations at your fingertips
- 🔍 **Powerful Search** - Search across all books or specific sections instantly
- 📝 **Smart Note-Taking** - Notes automatically linked to verses
- 🎓 **Inductive Study Method** - Built-in templates for observation, interpretation, and application
- 🌐 **Publishing Ready** - Export your studies as a website
- ⌨️ **Keyboard-Driven** - Everything accessible without leaving the keyboard
- 🎨 **Distraction-Free** - Clean, minimal interface focused on the text

## ✨ Features

### Bible Study Tools
- **Quick Navigation** - Jump to any book, chapter, and verse with a few keystrokes
- **Cross-References** - Link verses together and build connection maps
- **Word Search** - Search by keywords across testaments or specific books
- **Original Language Tools** - Support for Hebrew/Greek study (with additional packages)

### Note-Taking System
- **Verse-Linked Notes** - Attach notes directly to specific verses
- **Auto-Indexing** - All notes automatically organized and indexed
- **Tag System** - Organize by topics, themes, or personal categories
- **Quick Capture** - Capture thoughts without disrupting your reading flow

### Content Creation
- **Sermon Templates** - Pre-configured templates for sermon preparation
- **Article Writing** - Tools for theological articles and blog posts
- **Lecture Notes** - Organize teaching materials and presentations
- **Inductive Studies** - Complete workflow for systematic Bible study

### Publishing
- **HTML Export** - Convert all content to a beautiful website
- **Customizable Themes** - Multiple CSS themes included
- **Static Site Ready** - Deploy to GitHub Pages, Netlify, or any static host

## 🚀 Installation

### Prerequisites

- **Emacs 27+** - [Download here](https://www.gnu.org/software/emacs/download.html)
- **Git** - [Download here](https://git-scm.com/downloads)
- **5 minutes** - Seriously, that's all it takes!

### Quick Install (Recommended)

```bash
# Clone and install in one command
curl -fsSL https://raw.githubusercontent.com/bc-abe/biblemacs/main/install.sh | bash
```

### Manual Installation

```bash
# 1. Clone the repository
git clone https://github.com/bc-abe/biblemacs.git ~/biblemacs

# 2. Run the setup script
cd ~/biblemacs
./setup.sh

# 3. Start BibleMacs
biblemacs
```

### Alternative: Clone and Configure

```bash
# Clone to your preferred location
git clone https://github.com/bc-abe/biblemacs.git ~/

# Run installer with custom directory
./install.sh --dir /path/to/biblemacs
```

## 🎓 Quick Start

### First Launch

1. **Start BibleMacs**: Run `biblemacs` or `emacs`
2. **Wait for package installation**: First launch installs required packages (3-5 minutes)
3. **Open the tutorial**: Press `C-SPC h t` (Control+Space, then h, then t)

### Essential Commands

All commands start with the leader key: `C-SPC` (Control + Space)

| Action | Keys | Description |
|--------|------|-------------|
| **Find Bible Book** | `C-SPC b f` | Browse and open any Bible book |
| **Search Bible** | `C-SPC b s` | Search for words/phrases |
| **New Note** | `C-SPC n n` | Create a new note |
| **Inductive Study** | `C-SPC i s` | Start structured Bible study |
| **Toggle Theme** | `C-SPC t t` | Switch between light/dark |
| **Command Palette** | `C-SPC SPC` | Access all commands |

### Your First Bible Study Session

```
1. Open a Bible book:        C-SPC b f → Select "John" → Enter
2. Create a study note:      C-SPC n n → Title: "John 3 Reflections"
3. Link to a verse:          C-SPC b l → Book: John, Chapter: 3, Verse: 16
4. Start inductive study:    C-SPC i s → Enter: John 3:1-21
5. Save your work:           C-x C-s
```

## 📁 Repository Structure

```
biblemacs/
├── install.sh           # Quick installer script
├── setup.sh            # Post-clone setup script
├── config/             # Core configuration
│   └── init.org        # Literate Emacs configuration
├── bible/              # Bible text files (.org format)
│   ├── README.md       # Bible file format guide
│   ├── Genesis.org     # Example: Genesis
│   └── ...            # Other Bible books
├── resources/          # Documentation and guides
│   ├── getting-started.org
│   └── inductive-study-guide.org
├── templates/          # Document templates
│   ├── sermon.org
│   ├── article.org
│   └── study.org
├── site/              # Website generation
│   └── static/        # CSS and assets
│       └── style.css
└── scripts/           # Utility scripts
    ├── txt2org.py     # Convert plain text Bibles
    └── xml2org.py     # Convert XML Bibles
```

## 📖 Documentation

### Included Guides

- **[Getting Started Guide](resources/getting-started.org)** - Complete beginner's guide
- **[Inductive Study Method](resources/inductive-study-guide.org)** - Learn the three-step Bible study method
- **[Configuration Guide](docs/configuration.md)** - Customize BibleMacs to your needs
- **[Bible File Format](bible/README.md)** - How to add Bible translations

### Online Resources

- **[Wiki](https://github.com/yourusername/biblemacs/wiki)** - Extended documentation
- **[Video Tutorials](https://youtube.com/biblemacs)** - Visual learning guides
- **[Community Forum](https://github.com/yourusername/biblemacs/discussions)** - Get help and share tips

## 🤝 Contributing

We welcome contributions from the community! Here's how you can help:

### Ways to Contribute

- **📝 Bible Texts** - Add public domain or freely licensed Bible translations
- **🛠️ Features** - Implement new features or improve existing ones
- **📚 Documentation** - Improve guides, tutorials, or add translations
- **🎨 Themes** - Create new color schemes or CSS styles
- **🐛 Bug Reports** - Help us identify and fix issues
- **💡 Ideas** - Suggest new features in the [discussions](https://github.com/yourusername/biblemacs/discussions)

### Development Setup

```bash
# Fork and clone your fork
git clone https://github.com/YOUR_USERNAME/biblemacs.git
cd biblemacs

# Create a feature branch
git checkout -b feature/your-feature-name

# Make changes and test
emacs --batch -l config/init.org

# Commit and push
git add .
git commit -m "Add: your feature description"
git push origin feature/your-feature-name

# Open a Pull Request
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

## 📋 Roadmap

- [x] Core Bible study functionality
- [x] Note-taking system
- [x] Inductive study templates
- [x] HTML publishing
- [ ] Bible translation converter tools
- [ ] Interlinear Hebrew/Greek support
- [ ] Mobile sync (via Syncthing/Dropbox)
- [ ] Collaborative study features
- [ ] Audio Bible integration
- [ ] AI-powered study assistant
- [ ] Mobile app companion

## 📄 License

BibleMacs is free software licensed under the [GNU General Public License v3.0](LICENSE).

**Important Note on Bible Texts**: Bible translations have their own copyright restrictions. Please ensure you have the right to use and distribute any Bible translation you add. See [bible/README.md](bible/README.md) for details.

## 🙏 Acknowledgments

- **Emacs Community** - For the amazing editor and ecosystem
- **Package Authors** - Contributors to vertico, consult, org-mode, and other packages
- **Bible Software Projects** - Inspiration from e-Sword, Logos, and others
- **Contributors** - Everyone who has helped improve BibleMacs

## 💬 Support

- **📧 Email**: biblemacs@example.com
- **💬 Discord**: [Join our server](https://discord.gg/biblemacs)
- **🐛 Issues**: [Report bugs](https://github.com/yourusername/biblemacs/issues)
- **💡 Discussions**: [Ask questions](https://github.com/yourusername/biblemacs/discussions)

## 🌟 Star History

[![Star History Chart](https://api.star-history.com/svg?repos=yourusername/biblemacs&type=Date)](https://star-history.com/#yourusername/biblemacs&Date)

---

<div align="center">

**Made with ❤️ for Bible students everywhere**

*"Your word is a lamp to my feet and a light to my path." - Psalm 119:105*

[⬆ Back to top](#biblemacs---emacs-for-bible-study-)

</div>
