# MrAsk

AI-powered command line assistant for Debian-based systems. Ask questions in natural language, get shell commands via selectable list using fzf.

![Version](https://img.shields.io/badge/version-1.0.2-blue)
![Platform](https://img.shields.io/badge/platform-Linux-green)
![License](https://img.shields.io/badge/license-CC%20BY--NC%204.0-lightgrey)

## Features

- 🤖 **AI-Powered**: Uses OpenRouter API for intelligent command suggestions
- ⌨️ **Natural Language**: Ask "how do I find large files" instead of memorizing commands
- 🎯 **Interactive Selection**: Browse suggestions with fzf, press Enter to run
- 📝 **Smart Explanations**: Press `i` to see what a command does before running
- 📜 **Command History**: `ask -h` to browse, search, and re-run past commands
- ⚙️ **Configurable**: Choose your AI model, API endpoint, and settings

## Installation

```bash
# Download the .deb package
wget https://github.com/dalekirkwood/MrAsk/releases/download/v1.0.2/ask-cli_1.0.2_all.deb

# Install
sudo dpkg -i ask-cli_1.0.2_all.deb

# Or if dependencies are missing:
sudo apt install -f
```

### Dependencies

The package will automatically install:
- `jq` - JSON processor
- `fzf` - Fuzzy finder
- `curl` - HTTP client

## Quick Start

1. **Configure your API key** (get one free at [openrouter.ai](https://openrouter.ai)):
   ```bash
   ask -c
   ```

2. **Ask a question**:
   ```bash
   ask how do I find files larger than 100MB
   ```

3. **Select and run** a command from the list

## Usage

### Basic Commands

```bash
ask QUESTION                    # Ask AI for command suggestions
ask -c, --config               # Configure API settings
ask -h, --history              # View command history
ask -k KEY                     # Set API key directly
ask -m MODEL                   # Set AI model (e.g., openai/gpt-4)
ask --help                     # Show help
```

### During Selection

When browsing command suggestions:
- **Enter** - Run the selected command
- **i** - Show detailed explanation
- **q / Esc** - Quit without running

### Command History

View your past commands with explanations:
```bash
ask -h
```

The history interface shows:
- Timestamp
- Command
- Original question
- Full explanation (in preview window)

## Configuration

Config file location: `~/.config/ask/config.conf`

Example configuration:
```bash
API_KEY="sk-or-v1-xxxxxxxx"
MODEL="openrouter/auto"
ENDPOINT="https://openrouter.ai/api/v1/chat/completions"
```

### Available Models

Popular models on OpenRouter:
- `openrouter/auto` - Automatically selects best available model
- `meta-llama/llama-3.2-3b-instruct` - Fast and efficient
- `anthropic/claude-3.5-sonnet` - High quality responses
- `openai/gpt-4o-mini` - Balanced performance

## How It Works

1. **Ask** - You type a natural language question
2. **Query** - MrAsk sends your question to OpenRouter AI
3. **Parse** - AI returns 3-5 relevant shell commands with explanations and danger levels
4. **Select** - fzf displays commands with color-coded danger levels:
   - 🟢 `[safe]` - Non-destructive commands
   - 🟡 `[warning]` - Potentially destructive (edit, modify)
   - 🔴 `[dangerous]` - Destructive (rm -rf, dd, etc.)
5. **Execute** - Your chosen command runs in the terminal

## Safety Features

- Commands are marked with danger levels
- Review with `i` key before running
- Command history tracks what you've run
- No automatic execution - you always choose

## Building from Source

```bash
# Clone the repository
git clone https://github.com/dalekirkwood/MrAsk.git
cd MrAsk

# Build the .deb package
dpkg-deb --build --root-owner-group ask-cli

# Install
sudo dpkg -i ask-cli_1.0.2_all.deb
```

## File Structure

```
ask-cli/
├── DEBIAN/
│   ├── control          # Package metadata
│   └── postinst         # Post-installation script
└── usr/
    └── bin/
        └── ask          # Main executable script
```

## Troubleshooting

### "API key not configured"
Run `ask -c` to set up your OpenRouter API key

### "API request failed (HTTP 400)"
- Check your API key is correct
- Verify the model name exists on OpenRouter
- Check your OpenRouter account has credits

### Slow history
History is limited to last 100 entries for performance. Delete `~/.config/ask/history.json` to reset.

## Contributing

Contributions welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

This project is licensed under the **Creative Commons Attribution-NonCommercial 4.0 International License (CC BY-NC 4.0)**.

- ✅ **Personal use** - Free to use for personal, educational, and non-commercial purposes
- ✅ **Share** - You can share the software with others
- ✅ **Modify** - You can modify and create derivatives
- ❌ **Commercial use** - Commercial use is prohibited without explicit permission

See [LICENSE](LICENSE) for full details.

**For commercial licensing inquiries, please contact the author.**

## Credits

Created with ❤️ using:
- [OpenRouter](https://openrouter.ai) - AI API aggregation
- [fzf](https://github.com/junegunn/fzf) - Fuzzy finder
- [jq](https://stedolan.github.io/jq/) - JSON processor

---

**Pro Tip**: Add `alias a='ask'` to your `.bashrc` for even quicker access!
