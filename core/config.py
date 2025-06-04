# brainlogs/core/config.py



from pathlib import Path

# use home dir or current dir fallback
BASE_DIR = Path.home() / ".brainlogs" # hidden but can be edited 
DB_FILE = BASE_DIR / "brainlogs.db"

# ensure base dir exists
BASE_DIR.mkdir(parents=True, exist_ok=True)


# to be expanded