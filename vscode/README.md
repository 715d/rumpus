# Rumpus Theme for Visual Studio Code

A warm, earthy color scheme inspired by 1970s rumpus rooms and mid-century modern design aesthetics.

## Features

- Authentic 70s palette (harvest gold, avocado green, burnt orange, walnut)
- Furniture-inspired colors from iconic wood paneling and appliances
- Period-accurate colors that intentionally "clash" in that distinctive 70s way
- Comprehensive syntax highlighting for all major languages
- Full terminal color support (16 ANSI colors)

## Color Palette

**Primary Colors:**
- Walnut (#2A1810) - Background
- Tan/Beige (#F4DDB3) - Foreground
- Harvest Gold (#E9A131) - Highlights, Functions
- Burnt Orange (#F67422) - Keywords, Emphasis
- Avocado Green (#79966d) - Strings, Success
- Slate Blue (#5B7C99) - Operators, Properties
- Mustard Yellow (#D3BE47) - Types, Numbers
- Rust Red (#E84A38) - Errors

## Installation

### VS Code Marketplace

1. Extensions view (`Ctrl+Shift+X` or `Cmd+Shift+X`)
2. Search for "Rumpus Theme"
3. Click Install

## Usage

After installation, activate the theme via:
- Command Palette: `Preferences: Color Theme` > "Rumpus"
- Settings: `File > Preferences > Color Theme` > "Rumpus"

Or add to your `settings.json`:
```json
{
  "workbench.colorTheme": "Rumpus"
}
```

## Customization

You can override specific colors in your `settings.json`:

```json
{
  "workbench.colorTheme": "Rumpus",
  "workbench.colorCustomizations": {
    "[Rumpus]": {
      "editor.background": "#2A1810"
    }
  }
}
```

## Design Philosophy

Rumpus evokes the aesthetic of 1970s basement rumpus rooms:
- Warm, earthy tones (browns, oranges, yellows, greens)
- Colors that intentionally "clash" by modern standards
- Muted, desaturated hues (no neon or bright primaries)
- Nostalgic feel of wood paneling, shag carpet, and harvest gold appliances

Unlike other retro terminal themes:
- Not sci-fi themed
- Not monochrome
- Not neon/synthwave
- Darker with more authentic 70s colors
- Domestic/furniture inspired rather than arcade or CRT aesthetics

## Terminal Support

The theme includes full terminal color customization with all 16 ANSI colors properly mapped to the Rumpus palette. The integrated terminal will match your editor theme automatically.

## Other Tools

Rumpus is also available for:
- Ghostty terminal
- Zellij multiplexer
- Fish shell
- Helix editor
- Zed editor
- iTerm2

See the [main repository](https://github.com/715d/rumpus) for installation instructions.

## License

MIT

## Author

715d

## Links

- [GitHub Repository](https://github.com/715d/rumpus)
- [Report Issues](https://github.com/715d/rumpus/issues)
