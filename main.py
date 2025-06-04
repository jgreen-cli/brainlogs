# brainlogs/main.py

from core.db import initialize
from core.cli import run


if __name__ == "__main__":
    initialize()
    run()