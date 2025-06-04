# brainlogs/core/db.py

import sqlite3
from .config import DB_FILE, DEBUG

def get_connection():
    if DEBUG:
        print(f"Connecting to DB at: {DB_FILE}")
    try:
        conn = sqlite3.connect(DB_FILE)
        if DEBUG:
            print("Connection successful.")
        return conn
    except Exception as e:
        print(f"Error connecting to DB: {e}")
        raise

def initialize():
    if DEBUG:
        print(f"Initializing DB at: {DB_FILE}")
    try:
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
            if DEBUG:
                print("DB initialized.")
    except Exception as e:
        print(f"Error initializing DB: {e}")
        raise

def add_log(message: str, tags: list[str]):
    from datetime import datetime
    timestamp = datetime.now().strftime("%Y-%m-%d %I:%M %p")
    tags_str = ",".join(tags) if tags else None
    if DEBUG:
        print(f"Adding log: '{message}' with tags: {tags}")
    try:
        with get_connection() as conn:
            cursor = conn.cursor()
            cursor.execute("INSERT INTO logs (timestamp, message, tags) VALUES (?, ?, ?)", 
                           (timestamp, message, tags_str)
            )
            conn.commit()
            print(f"Log added successfully: '{message}'")
    except Exception as e:
        print(f"Error adding log: {e}")
        raise

def get_logs(filter_tag: str = None) -> list[tuple]:
    if DEBUG:
        print(f"Fetching logs. Filter tag: {filter_tag}")
    try:
        with get_connection() as conn:
            cursor = conn.cursor()
            if filter_tag:
                cursor.execute("SELECT timestamp, message, tags FROM logs WHERE tags LIKE ? ORDER BY id DESC", (f"%{filter_tag}%",))
            else:
                cursor.execute("SELECT timestamp, message, tags FROM logs ORDER BY id DESC")
            logs = cursor.fetchall()
            if DEBUG:
                print(f"Fetched {len(logs)} logs.")
            return logs
    except Exception as e:
        print(f"Error fetching logs: {e}")
        return []

