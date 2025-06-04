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

## ⚠️ Project Status & Important Notes

**Development Stage Notice:**  
This project is currently in its **early experimental phase** (v0.x). While functional for basic use, please be aware that:
- Core functionality is stable but edge cases may exist
- Database schema may evolve in future versions
- Windows support is preliminary and needs community validation

**Platform Support:**  
| System | Support Level | Testing Status |
|--------|--------------|----------------|
| Linux  | Primary      | Basic validation complete |
| macOS  | Community    | Limited testing |
| Windows| Experimental | Installation verified only |

**Security Advisory:**  
🔐 **Important:** All journal entries are stored locally in plaintext format.  
- Do **not** store sensitive information (passwords, credentials, etc.)
- Consider enabling full-disk encryption on your system
- Be mindful of system access permissions

**Data Management:**  
- Maintain regular backups of your `~/.brainlogs/` directory
- The `purge` uninstall option will permanently delete all logs
- No automatic backup or versioning exists in current version

**Contribution & Feedback:**  
We welcome constructive issue reports and feedback via our [GitHub Issues](https://github.com/GuyWithAFrownyFace/brainlogs/issues) page. Please include:
- Your operating system
- Steps to reproduce any issues
- Suggestions for improvements

*This software is provided "as-is" without warranty. Users assume responsibility for their data.*


### 🔧 Clone the Repo

```bash
git clone https://github.com/GuyWithAFrownyFace/brainlogs.git
cd brainlogs
```

Linux / macOS

```bash
chmod +x install/install.sh
./install/install.sh
# must be inside of brainlogs directory
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

- Setup package manager for Windows and Linux instead of manual install
- JSON or Markdown export
- Tag autocomplete
- UI viewer (TUI or GUI)
- Cloud sync or encrypted backup (optional)


## For Developers

Modify `core/config.py` to change DB path or expand functionality.


## Author

Made by **GuyWithAFrownyFace** as a learning project to sharpen Python, CLI, and cross-platform scripting skills

## ⚙️ Dependencies

| Platform | Requirements | 
|----------|--------------|
| **All Systems** | Python 3.8+ ([Install Guide](https://www.python.org/downloads/)) |
| **Windows Only** | PowerShell 5.1+ (Preinstalled on Win10/11) |
| **Linux/macOS** | Standard shell (bash/zsh) |
<sub>💡 Note: No additional libraries required - all dependencies ship with Python</sub>

**Verify installations:**
```bash
# Python
python3 --version

# PowerShell (Windows)
$PSVersionTable.PSVersion