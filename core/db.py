# brainlogs/core/db.py

import sqlite3
from .config import DB_FILE

def get_connection():
    return sqlite3.connect(DB_FILE)

def initialize():
    print(f"Initializing DB at: {DB_FILE}")  # not sure why it messes up the print statement like that
    with get_connection() as conn:
        cursor = conn.cursor()
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS logs (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                timestamp TEXT NOT NULL,
                message TEXT NOT NULL,
                tags TEXT
            )
        """)
        conn.commit()
        print("DB initialized")  #


def add_log(message: str, tags: list[str]):
    from datetime import datetime
    timestamp = datetime.now().strftime("%Y-%m-%d %I:%M %p")


    tags_str = ",".join(tags) if tags else None

    with get_connection() as conn:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO logs (timestamp, message, tags) VALUES (?, ?, ?)", 
                       (timestamp, message, tags_str)
        )

def get_logs(filter_tag: str = None) -> list[tuple]:
    with get_connection() as conn:
        cursor = conn.cursor()
        if filter_tag:
            cursor.execute("SELECT timestamp, message, tags FROM logs WHERE tags LIKE ?", (f"%{filter_tag}%",))
        else:
            cursor.execute("SELECT timestamp, message, tags FROM logs")
        return cursor.fetchall()
    
