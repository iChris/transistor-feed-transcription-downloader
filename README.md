# Podcast Transcript Downloader

Enhanced transcript downloader for the "How About Tomorrow?" podcast that extracts episode metadata, timestamps, and topics from the RSS feed.

## Features

- 📝 Downloads full episode transcripts
- 📊 Extracts episode metadata (titles, numbers, publication dates)
- ⏰ Includes timestamped topic lists
- 🎯 Smart filename generation
- 🎨 Colorized terminal output
- 📁 Configurable output directory
- 🔢 Limit download count for testing

## Installation

### Quick Install (Recommended)

```bash
# Download and install
curl -L https://raw.githubusercontent.com/YOUR_USERNAME/podcast-transcript-downloader/main/podcast-transcript-downloader -o podcast-transcript-downloader
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
chmod +x podcast-transcript-downloader

# Optional: Add to PATH
ln -s $(pwd)/podcast-transcript-downloader /usr/local/bin/podcast-transcript-downloader
```

## Usage

### Basic Usage

```bash
# Download all episodes to current directory
./podcast-transcript-downloader

# Download to specific directory
./podcast-transcript-downloader -d ~/Downloads/Podcasts

# Download only the 5 most recent episodes
./podcast-transcript-downloader -c 5

# Combine options
./podcast-transcript-downloader -d ~/Downloads -c 10
```

### Command Line Options

| Option | Description |
|--------|-------------|
| `-h, --help` | Show help message |
| `-v, --version` | Show version information |
| `-d, --dir DIR` | Output directory (default: current directory) |
| `-c, --count N` | Limit to N most recent episodes |

### Examples

```bash
# Download all episodes
podcast-transcript-downloader

# Download to Downloads folder
podcast-transcript-downloader --dir ~/Downloads

# Get just the latest 3 episodes for testing
podcast-transcript-downloader --count 3

# Download to custom directory with episode limit
podcast-transcript-downloader -d /path/to/podcasts -c 20
```

## Output Format

Each transcript file includes:

```
================================================================================
EPISODE INFORMATION
================================================================================
Episode ID: 5bb7c347
Episode Number: 143
Title: Missouri Humidity and AI Hype Cycles
Published: Tue, 26 Aug 2025 04:00:00 -0700
Downloaded: Mon Sep 24 20:46:37 PDT 2025

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

Files are automatically named using the pattern:
- `ep_143_Missouri_Humidity_and_AI_Hype_Cycles.txt`
- `ep_142_Why_Does_Everyone_Hate_Software_Developers.txt`

## Requirements

- **curl** - For downloading RSS feed and transcripts
- **awk**, **sed**, **grep** - Standard Unix text processing tools (included on macOS/Linux)

All dependencies are typically pre-installed on macOS and Linux systems.

## Supported Platforms

- ✅ macOS
- ✅ Linux
- ✅ Windows (WSL/Git Bash)

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Troubleshooting

### Common Issues

**"Command not found"**
- Make sure the script is executable: `chmod +x podcast-transcript-downloader`
- Check that it's in your PATH or use `./podcast-transcript-downloader`

**"Failed to download RSS feed"**
- Check your internet connection
- Verify the RSS URL is accessible: `curl https://feeds.transistor.fm/tomorrow`

**"Missing required dependencies"**
- Install missing tools using your package manager
- On macOS: Dependencies are typically pre-installed
- On Linux: `sudo apt install curl` (curl is usually the only one that might be missing)

### Getting Help

- 🐛 **Bug Reports**: [Open an issue](https://github.com/YOUR_USERNAME/podcast-transcript-downloader/issues)
- 💡 **Feature Requests**: [Open an issue](https://github.com/YOUR_USERNAME/podcast-transcript-downloader/issues)
- ❓ **Questions**: Check existing issues or open a new one

## Changelog

### v1.0.0
- Initial release
- Episode metadata extraction
- Timestamped topics
- Configurable output directory
- Episode count limiting
- Colorized output

## Credits

- Podcast: ["How About Tomorrow?"](https://tomorrow.fm) by Adam Elmore & Dax Raad
- RSS Feed: Powered by [Transistor](https://transistor.fm)
