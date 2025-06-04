# 🧠 Logs

A cross-platform, local-first CLI journaling and tagging tool for developers, and note-takers.

**brainlogs** helps you quickly log thoughs, progress, events, or tasks directly from the terminal. Logs are stored in a lightweight SQLite database for fast access, filtering, and future expansion into full UIs or export tools.


## Features

- ✅ Simple command-line usage
- ✅ Log entries with optional tags
- ✅ View logs by date or tag
- ✅ Auto-creates and manages the local SQLite database
- ✅ Works on **Windows** and **Linux**
- ✅ Includes optional install scripts to create command aliases (e.g., `brlogs` or `bl`)


## 📦 Install


### 🔧 Clone the Repo

```bash
git clone https://github.com/GuyWithAFrownyFace/brainlogs.git
cd brainlogs
```

Linux / macOS

```bash
chmod +x install/install.sh
./install/install.sh
```

Windows (PowerShell)

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
.\install\install.ps1
```

This will add an alias (**brlogs**) to your shell profile so you can run logs from anywhere.


## Usage

Create a log

```bash
brlogs Finished setting up server -tags progress linux
```

View all logs

```bash
brlogs -r
```

Filter by tag

```bash
brlogs -r linux
```

Uninstall shortcut (Windows)

```powershell
.\install\install.ps1 uninstall
```

Uninstall symlink (Linux)

```bash
./install/install.sh uninstall
```

Full uninstall (includes DB) Windows

```powershell
.\install\install.ps1 purge
```

Full uninstall (includes DB) Linux

```bash
./install/install.sh purge
```



## Structure

brainlogs/

 - core/
    - __init__.py --removed
    - cli.py
    - config.py
    - db.py
 - install/
    - install.ps1
    - install.sh
 - .gitignore
 - main.py
 - README.md
 - run.bat
 - run.sh

SQLite DB is stored in:

- Linux/macOS: `~/.brainlogs/brainlogs.db`
- Windows: `C:\Users\<Username>\.brainlogs\brainlogs.db`


## Roadmap

- JSON or Markdown export
- Tag autocomplete
- UI viewer (TUI or GUI)
- Cloud sync or encrypted backup (optional)


## For Developers

Modify `core/config.py` to change DB path or expand functionality.


## Author

Made by **GuyWithAFrownyFace** as a learning project to sharpen Python, CLI, and cross-platform scripting skills