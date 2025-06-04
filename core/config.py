# brainlogs/core/config.py



from pathlib import Path

# use home dir or current dir fallback
BASE_DIR = Path.home() / ".brainlogs" # hidden but can be edited 
DB_FILE = BASE_DIR / "brainlogs.db"

# ensure base dir exists
if not BASE_DIR.exists():
    print(f"Creating DB directory at: {BASE_DIR}")
    BASE_DIR.mkdir(parents=True, exist_ok=True)
    print("DB directory created.")
else:
    print(f"DB directory already exists at: {BASE_DIR}")

print(f"DB file will be at: {DB_FILE}")


# to be expanded