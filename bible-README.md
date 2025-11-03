# Bible Files Directory

This directory contains Bible text files in Org-mode format for use with BibleMacs.

## File Format

Each book of the Bible should be a separate `.org` file named exactly as the book name (e.g., `Genesis.org`, `Matthew.org`, `1_Corinthians.org`).

### Expected Structure

```org
#+TITLE: Book Name
#+AUTHOR: Translation Name
#+DESCRIPTION: The Book of [Name]

* Chapter 1

** Section Heading (optional)

<<1:1>> *1* Verse text here.

<<1:2>> *2* Next verse text here.

#+begin_notes
+1.1+ - Note about verse 1
+1.2+ - Cross-reference: [[file:OtherBook.org::chapter:verse][OtherBook chapter:verse]]
#+end_notes

* Chapter 2

...
```

## Naming Convention

| Book | Filename |
|------|----------|
| Genesis | `Genesis.org` |
| Exodus | `Exodus.org` |
| 1 Samuel | `1_Samuel.org` |
| 2 Samuel | `2_Samuel.org` |
| Song of Solomon | `Song_of_Solomon.org` |
| 1 Corinthians | `1_Corinthians.org` |
| Revelation | `Revelation.org` |

Use underscores instead of spaces in filenames.

## Adding Bible Translations

### Option 1: Manual Conversion

1. Download plain text Bible from:
   - [BibleGateway](https://www.biblegateway.com/)
   - [Bible.org](https://netbible.org/)
   - [Berean Bible](https://bereanbible.com/)

2. Convert to Org format:
   - Add chapter markers: `* Chapter N`
   - Add verse markers: `<<chapter:verse>> *verse* text`
   - Optionally add notes sections

### Option 2: Use Conversion Scripts

Check the `/scripts` directory for Bible conversion utilities:
- `txt2org.py` - Convert plain text to Org format
- `xml2org.py` - Convert XML (OSIS, Zefania) to Org format

### Option 3: Download Pre-formatted

Pre-formatted Bible files in Org format may be available from the BibleMacs community.

## Copyright Notice

⚠️ **Important**: Bible translations are copyrighted works. Please ensure you have the right to use and distribute any Bible translation you add to this directory. 

### Public Domain Translations
- King James Version (KJV)
- American Standard Version (ASV)
- World English Bible (WEB)
- Young's Literal Translation (YLT)

### Freely Licensed
- Berean Study Bible (BSB) - Free for non-commercial use
- NET Bible - Free with attribution

### Restricted Translations
Most modern translations (NIV, ESV, NASB, etc.) require licensing for distribution. You may use them for personal study but cannot redistribute them.

## Structure Guidelines

### Verse References
Use the format `<<chapter:verse>>` for verse anchors. This allows for easy linking:
```org
<<3:16>> *16* For God so loved the world...
```

### Cross-References
Link to other verses using Org links:
```org
See also: [[file:Matthew.org::5:44][Matthew 5:44]]
```

### Study Notes
Add notes in dedicated sections:
```org
#+begin_notes
+16.1+ - Greek: "agapao" - divine love
+16.2+ - Cross-ref: [[file:Romans.org::5:8][Romans 5:8]]
#+end_notes
```

### Section Headings
Optional section headings can be added as level 2 headers:
```org
* John 3

** Jesus and Nicodemus

<<3:1>> *1* Now there was a Pharisee...
```

## File Validation

To verify your Bible files are correctly formatted:

1. Open in Emacs with BibleMacs
2. Try the search function (`C-SPC b s`)
3. Test verse linking (`C-SPC b l`)
4. Check that navigation works (`C-SPC b f`)

## Contributing

If you create well-formatted Bible files, consider contributing them back to the community (respecting copyright laws). See the main README for contribution guidelines.

## Questions?

For help with Bible file formatting or conversion, please:
- Check the documentation in `/resources`
- Visit the project GitHub page
- Ask in the community forums
