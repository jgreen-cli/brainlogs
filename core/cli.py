# brainlogs/core/cli.py
import sys
from . import db #from (here) import database

def run():
    args = sys.argv[1:]

    if not args: # if args are not present list usage
        print("Usage:")
        print("  brainlog <message> [-tags tag1 tag2 ...]")
        print("  brainlog -r [tag]")
        return

    # READ MODE
    if args[0] in ("-r", "--read"): # check for tags
        filter_tag = args[1] if len(args) > 1 else None 
        logs = db.get_logs(filter_tag)
        if not logs:
            print("No logs found." if not filter_tag else f"No logs found with tag '{filter_tag}'")
            return
        for timestamp, message, tags in logs:
            print(f"🧠 [{timestamp}] {message}")
            if tags:
                print(f"   → Tags: {tags}")
        return  # Important: return here so it doesn't continue to logging

    # LOGGING MODE
    if "-tags" in args: #if there are tags then split from msg 
        split_index = args.index("-tags")
        message_parts = args[:split_index]
        tags = args[split_index + 1:]
    else:
        message_parts = args
        tags = []

    message = " ".join(message_parts).strip() # message parts is a table of ("str" -tags "split" "strings")

    if not message:
        print("Error: Log message is empty.")
        return

    db.add_log(message, tags) # if there is a message and or tags then add the log to the database and print it to verify
    print(f"✅ Log saved: \"{message}\"")
    if tags:
        print(f"   → Tags: {', '.join(tags)}") # print tags if there are tags

