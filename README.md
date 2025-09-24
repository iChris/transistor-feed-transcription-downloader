# Generic Podcast Transcript Downloader

A versatile transcript downloader for podcasts that extracts episode metadata, timestamps, and topics from RSS feeds. Works with any podcast that provides text transcripts!

## ✨ Features

- 📻 **Multi-podcast support** - Works with any podcast RSS feed
- 🎯 **Interactive mode** - Prompts you to select from popular shows or enter custom URLs
- 📝 **Enhanced transcripts** with episode metadata, timestamps, and topics
- 🎨 **Beautiful terminal output** with colors and progress tracking
- 📁 **Smart file naming** using show names and episode titles
- 🔢 **Episode limiting** for testing or partial downloads
- 🛡️ **Error handling** and validation
- 🎪 **Predefined shows** for popular tech podcasts

## 🎙️ Supported Shows (Predefined)

- **How About Tomorrow?** - Adam Elmore & Dax Raad (`tomorrow`)
- **Syntax** - Wes Bos & Scott Tolinski (`syntax`)
- **The Changelog** - Software development podcast (`changelog`)
- **JS Party** - JavaScript community podcast (`jsparty`)
- **Shopify Engineering** - Engineering at Shopify (`shopify`)
- **Custom RSS URLs** - Any podcast with text transcripts

## 🚀 Installation

### Quick Install (Recommended)

```bash
# Download and install
curl -L https://raw.githubusercontent.com/YOUR_USERNAME/podcast-transcript-downloader/main/podcast-transcript-downloader-generic -o podcast-transcript-downloader
chmod +x podcast-transcript-downloader

# Move to your PATH (optional)
sudo mv podcast-transcript-downloader /usr/local/bin/
```

### Manual Install

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/podcast-transcript-downloader.git
cd podcast-transcript-downloader

# Make executable
chmod +x podcast-transcript-downloader-generic

# Optional: Add to PATH
ln -s $(pwd)/podcast-transcript-downloader-generic /usr/local/bin/podcast-transcript-downloader
```

## 📖 Usage

### Interactive Mode (Default)

Simply run the command and you'll be prompted to select a show:

```bash
podcast-transcript-downloader
```

This will show you:
```
📻 Generic Podcast Transcript Downloader

Select a podcast show to download transcripts from:

  1) How About Tomorrow? (tomorrow)
  2) Syntax (syntax)
  3) The Changelog (changelog)
  4) JS Party (jsparty)
  5) Shopify Engineering (shopify)
  
  6) Enter custom RSS URL

Enter your choice (1-6):
```

### Command Line Options

| Option | Description |
|--------|-------------|
| `-h, --help` | Show help message |
| `-v, --version` | Show version information |
| `-d, --dir DIR` | Output directory (default: current directory) |
| `-c, --count N` | Limit to N most recent episodes |
| `-u, --url URL` | Custom RSS feed URL |
| `-s, --show SHOW` | Predefined show shortname |
| `-l, --list` | List available predefined shows |
| `-i, --interactive` | Force interactive mode |

### Examples

```bash
# Interactive mode (default)
podcast-transcript-downloader

# Download specific show
podcast-transcript-downloader -s tomorrow

# Custom RSS URL
podcast-transcript-downloader -u "https://feeds.example.com/podcast"

# Download to specific directory
podcast-transcript-downloader -s syntax -d ~/Downloads/Podcasts

# Limit to 5 most recent episodes
podcast-transcript-downloader -s tomorrow -c 5

# List available shows
podcast-transcript-downloader -l

# Custom URL with specific directory and episode limit
podcast-transcript-downloader -u "https://feeds.example.com/podcast" -d ~/Transcripts -c 10
```

## 📄 Output Format

Each transcript file includes comprehensive metadata:

```
================================================================================
EPISODE INFORMATION
================================================================================
Show: How About Tomorrow?
Episode ID: 5bb7c347
Episode Number: 143
Title: Missouri Humidity and AI Hype Cycles
Published: Tue, 26 Aug 2025 04:00:00 -0700
Downloaded: Mon Sep 24 20:53:43 PDT 2025
Source URL: https://share.transistor.fm/s/5bb7c347/transcription.txt

================================================================================
TOPICS & TIMESTAMPS
================================================================================
  00:00 - Adam's going cordless
  00:34 - Protein bars melt in the Florida heat
  03:28 - Is there anything good about living in Missouri?
  07:23 - Cursed with the knowledge of better things
  [... more topics ...]

================================================================================
TRANSCRIPT
================================================================================
[Full transcript content here...]
```

### Filename Format

Files are automatically named with show prefixes:
- `tomorrow_ep_143_Missouri_Humidity_and_AI_Hype_Cycles.txt`
- `syntax_ep_542_The_Future_of_Web_Development.txt`
- `custom_podcast_ep_15_Amazing_Episode_Title.txt`

## 🛠️ Requirements

- **curl** - For downloading RSS feeds and transcripts
- **awk**, **sed**, **grep** - Standard Unix text processing tools (included on macOS/Linux)

All dependencies are typically pre-installed on macOS and Linux systems.

## 🌐 Adding Your Own Podcast

### Method 1: Use Custom URL

```bash
podcast-transcript-downloader -u "https://your-podcast-rss-feed.com/feed.xml"
```

### Method 2: Add to Predefined Shows

Edit the script and add your show to the `SHOWS` array:

```bash
declare -A SHOWS=(
    # ... existing shows ...
    ["yourshow"]="https://your-feed-url.com/rss|Your Show Name"
)
```

## 🎯 Supported Platforms

- ✅ **macOS** - Full support
- ✅ **Linux** - Full support  
- ✅ **Windows** - WSL/Git Bash/Cygwin

## 🤝 Contributing

We'd love your help! Here are some ways to contribute:

### Adding More Predefined Shows

1. Find a podcast with text transcripts in their RSS feed
2. Add it to the `SHOWS` array in the script
3. Submit a pull request

### Popular Shows to Add

Help us add support for:
- **Shop Talk Show** - Web development
- **Full Stack Radio** - Adam Wathan's podcast
- **The Stack Overflow Podcast**
- **CodePen Radio** - Development stories
- **Ladybug Podcast** - Tech careers

### Development

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Test with multiple podcast feeds
4. Commit your changes (`git commit -m 'Add amazing feature'`)
5. Push to the branch (`git push origin feature/amazing-feature`)
6. Open a Pull Request

## 🔧 Troubleshooting

### Common Issues

**"No transcript URLs found"**
- The podcast may not provide text transcripts
- Some shows only have audio/video transcripts
- Try using the `-u` option with a direct RSS URL

**"RSS feed appears invalid"**
- Check your internet connection
- Verify the RSS URL is correct and accessible
- Some feeds may be geo-restricted

**"Command not found"**
- Make sure the script is executable: `chmod +x podcast-transcript-downloader`
- Check that it's in your PATH or use `./podcast-transcript-downloader`

### Debug Mode

Run with verbose output to see what's happening:

```bash
# Add debug info by running the script with bash -x
bash -x podcast-transcript-downloader -s tomorrow -c 1
```

## 🎉 What's New in v2.0.0

- 🆕 **Generic podcast support** - Works with any RSS feed
- 🎯 **Interactive show selection** - User-friendly prompts
- 📻 **Predefined popular shows** - Quick access to common podcasts
- 🛡️ **Better error handling** - More informative error messages
- 🎨 **Enhanced terminal output** - Colors and better formatting
- 🔍 **RSS feed validation** - Checks feed validity before processing
- 📝 **Flexible topic extraction** - Works with different RSS formats

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Credits

- Original idea inspired by "How About Tomorrow?" podcast transcripts
- Built for podcast lovers who want searchable, offline transcripts
- Thanks to all the podcasters who provide transcript accessibility

---

**Happy podcast downloading!** 🎧✨
