# BibleMacs GitHub Repository Setup Guide

This guide will help you set up your BibleMacs GitHub repository with all the provided files.

## Repository Structure

After setting up, your repository should look like this:

```
biblemacs/
├── .gitignore              # Git ignore rules
├── LICENSE                 # GPL v3 license
├── README.md               # Main repository README (use github-README.md)
├── CONTRIBUTING.md         # Contribution guidelines
├── install.sh              # One-line installer script
├── setup.sh               # Post-clone setup script
├── config/
│   └── init.org           # Main BibleMacs configuration
├── bible/
│   ├── README.md          # Bible format documentation (use bible-README.md)
│   ├── Genesis.org        # Example Bible book (use Genesis-example.org)
│   └── [Your Bible files] # Add your Bible .org files here
├── resources/
│   ├── getting-started.org      # User tutorial
│   └── inductive-study-guide.org # Inductive study method guide
├── site/
│   └── static/
│       └── style.css      # Website CSS
├── templates/             # Create this folder for templates
├── scripts/              # Create this folder for utility scripts
└── docs/                 # Create this folder for additional docs
```

## Step-by-Step Setup

### 1. Create GitHub Repository

1. Go to [GitHub](https://github.com)
2. Click "New repository"
3. Name it: `biblemacs`
4. Description: "Emacs distribution for Bible study"
5. Choose: Public (or Private if preferred)
6. Initialize with: Nothing (we'll push everything)
7. Create repository

### 2. Organize Files Locally

```bash
# Create main directory
mkdir biblemacs
cd biblemacs

# Create subdirectories
mkdir -p config bible resources site/static templates scripts docs

# Copy files to correct locations:
cp github-README.md README.md
cp LICENSE .
cp CONTRIBUTING.md .
cp .gitignore .
cp install.sh .
cp setup.sh .
cp init.org config/
cp bible-README.md bible/README.md
cp Genesis-example.org bible/Genesis.org
cp getting-started.org resources/
cp inductive-study-guide.org resources/
cp style.css site/static/

# Copy your Bible .org files
cp /path/to/your/bible/*.org bible/

# Make scripts executable
chmod +x install.sh setup.sh
```

### 3. Initialize Git and Push

```bash
# Initialize git repository
git init

# Add all files
git add .

# Initial commit
git commit -m "Initial commit: BibleMacs - Emacs for Bible Study"

# Add GitHub remote (replace with your username)
git remote add origin https://github.com/YOUR_USERNAME/biblemacs.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### 4. Add Bible Files

If you have Bible files in .org format:

```bash
# Copy Bible files to the bible directory
cp /path/to/bible/files/*.org bible/

# Add and commit
git add bible/
git commit -m "Add: Bible translation files"
git push
```

### 5. Create Release (Optional)

1. Go to your repository on GitHub
2. Click "Releases" → "Create a new release"
3. Tag version: `v1.0.0`
4. Release title: "BibleMacs v1.0.0 - Initial Release"
5. Describe the release features
6. Publish release

### 6. Update README

Edit README.md to replace placeholders:
- Replace `yourusername` with your GitHub username
- Update any URLs or links
- Add specific acknowledgments

### 7. Enable GitHub Pages (Optional)

To host documentation:
1. Go to Settings → Pages
2. Source: Deploy from a branch
3. Branch: main
4. Folder: /docs
5. Save

## Testing Your Repository

After setting up, test that users can install:

```bash
# Test the one-line installer
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/biblemacs/main/install.sh | bash

# Or clone and setup
git clone https://github.com/YOUR_USERNAME/biblemacs.git ~/test-biblemacs
cd ~/test-biblemacs
./setup.sh
```

## Customization

### Add Your Information

1. Update LICENSE with your name/organization
2. Add yourself to CONTRIBUTORS.md
3. Update contact information in README.md
4. Add your social media links

### Add Features

Consider adding:
- Bible conversion scripts in `/scripts`
- Additional templates in `/templates`
- More documentation in `/docs`
- GitHub Actions for CI/CD
- Issue templates
- Discussion categories

## Maintaining Your Repository

### Regular Updates

```bash
# Update your local repository
git pull origin main

# Make changes
# ... edit files ...

# Commit and push
git add .
git commit -m "Update: description of changes"
git push
```

### Managing Issues

1. Use GitHub Issues for bug tracking
2. Label issues appropriately
3. Create milestones for version planning
4. Use Projects for feature roadmap

### Managing Pull Requests

1. Review PRs promptly
2. Run tests before merging
3. Maintain a CHANGELOG.md
4. Thank contributors

## Promotion

Share your repository:
- Reddit: r/emacs, r/Christianity, r/Reformed
- Twitter/X: Use #emacs #BibleStudy hashtags
- Emacs mailing lists
- Christian tech communities
- Your church or study group

## Support

If you need help:
- Open an issue in the original repository
- Join Emacs communities
- Ask in GitHub Discussions

## License Reminder

Remember:
- Code is GPL v3
- Bible texts have their own copyrights
- Respect all licenses
- Give attribution where required

---

Good luck with your BibleMacs repository! May it be a blessing to many people studying God's Word.
