# brainlogs/core/config.py


from pathlib import Path # path is used here to make cross-platform a little bit easier
DEBUG = False
# use home dir
BASE_DIR = Path.home() / ".brainlogs" # hidden but can be edited 
DB_FILE = BASE_DIR / "brainlogs.db"

# ensure base dir exists
if not BASE_DIR.exists():
    print(f"Creating DB directory at: {BASE_DIR}")
    BASE_DIR.mkdir(parents=True, exist_ok=True)
    print("DB directory created.")
else:
    if DEBUG:
        print(f"DB directory already exists at: {BASE_DIR}")

if DEBUG:
    print(f"DB file will be at: {DB_FILE}")


# to be expanded