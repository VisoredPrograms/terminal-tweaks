## Setup Instructions

### 1. Install Packages

Use [Scoop](https://scoop.sh/) to install these useful packages:

```bash
scoop install 7zip ani-cli ffmpeg fzf git mpv ntop
```

These packages include essential tools for file compression, media playback, and system monitoring.

### 2. Install `winfetch`

To display system info in your terminal, you need to install `winfetch`. Run the following command in PowerShell:

```powershell
Install-Script -Name pwshfetch-test-1
```

This will install the necessary script to use `winfetch`.

### 3. Terminal Configuration

#### PowerShell Profile

Add the following to your PowerShell profile to initialize Starship and configure system info display:

```powershell
# Initialize Starship prompt
Invoke-Expression (&starship init powershell)

# Alias for system info
Set-Alias -Name winfetch -Value pwshfetch-test-1
winfetch

# Efficient system uptime function
function Get-Uptime {
    $uptime = New-TimeSpan -Start (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
    return "{0} days, {1} hours, {2} minutes, {3} seconds" -f $uptime.Days, $uptime.Hours, $uptime.Minutes, $uptime.Seconds
}

# Anime playback function
function Watch-Anime {
    param ([string[]]$args)
    Write-Host "Anime time, let's go!"
    & sh ani-cli @args
}
```

#### Terminal Themes

Set your preferred color theme and font. Use [FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases) for an optimal experience.

- **PowerShell (Windows Terminal)**: Add `Catppuccin Frappe` theme and set the font to `FiraCode Nerd Font`.
- **Hyper Terminal**: Use `Catppuccin` theme and apply the settings in `hyper.js` configuration.

---

## Terminal Configuration Files

### Windows Terminal

Customize your terminal with the following `profiles.json` settings:

```json
{
  "profiles": {
    "defaults": {
      "font": { "face": "FiraCode Nerd Font" },
      "colorScheme": "Catppuccin Frappe",
      "opacity": 80
    },
    "list": [
      {
        "commandline": "powershell.exe",
        "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
        "name": "Windows PowerShell"
      }
    ]
  }
}
```

### Hyper Terminal

For Hyper, use the following settings in `~/.hyper.js`:

```javascript
module.exports = {
  config: {
    opacity: 0.95,
    catppuccinTheme: "Frappé",
    fontSize: 16,
    fontFamily: "FiraCode Nerd Font, Consolas, 'Courier New', monospace",
    cursorColor: "rgba(248,28,229,0.8)",
    cursorShape: "BEAM",
    backgroundColor: "#000",
    selectionColor: "rgba(248,28,229,0.3)",
    colors: {
      black: "#000000",
      red: "#C51E14",
      green: "#1DC121",
      yellow: "#C7C329",
      blue: "#0A2FC4",
      magenta: "#C839C5",
      cyan: "#20C5C6",
      white: "#C7C7C7",
    },
    disableLigatures: false,
  },
  plugins: ["hyper-font-ligatures", "hypurr#latest", "hyper-opacity"],
};
```

---

## Notes

- **Packages**: If you're using Scoop for package management, the above list should cover your essentials.
- **Font**: FiraCode Nerd Font is highly recommended for both PowerShell and Hyper. Ensure that you download it from the [official repository](https://github.com/ryanoasis/nerd-fonts/releases).
- **Themes**: The `Catppuccin` theme provides a pleasant, colorful experience across terminals.

---

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
