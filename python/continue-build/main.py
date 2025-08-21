#!/usr/bin/env python

import argparse
import inotify.adapters
import subprocess
import os
import sys

def main():
    parser = argparse.ArgumentParser(description="Monitor a directory for changes and run a command.")
    parser.add_argument("path", help="The directory to monitor for changes.")
    parser.add_argument("command", nargs=argparse.REMAINDER, help="The command to execute when a file changes.")
    parser.add_argument("--cwd", help="The working directory for the command. Defaults to the monitored path.", default=None)
    parser.add_argument("--ignore-swp", action="store_true", help="Ignore .swp files (Vim swap files).")

    args = parser.parse_args()

    monitor_path = os.path.abspath(args.path)
    command_to_run = args.command
    command_cwd = os.path.abspath(args.cwd) if args.cwd else monitor_path
    ignore_swp = args.ignore_swp

    if not os.path.isdir(monitor_path):
        print(f"Error: Monitored path '{monitor_path}' is not a valid directory.", file=sys.stderr)
        sys.exit(1)

    if not command_to_run:
        print("Error: No command specified to run.", file=sys.stderr)
        sys.exit(1)

    print(f"Monitoring '{monitor_path}' for changes...")
    print(f"Command to run: {' '.join(command_to_run)}")
    print(f"Working directory for command: '{command_cwd}'")
    if ignore_swp:
        print("Ignoring .swp files.")

    i = inotify.adapters.InotifyTree(monitor_path)

    try:
        for event in i.event_gen():
            if event is not None:
                (header, type_names, watch_path, filename) = event
                
                # Only react to file modifications or close-write events
                if (header.mask & (inotify.constants.IN_MODIFY | inotify.constants.IN_CLOSE_WRITE)):
                    if ignore_swp and filename.endswith('.swp'):
                        continue
                    
                    print(f"\n--- Change detected in '{os.path.join(watch_path, filename)}' ---")
                    print(f"Running command: {' '.join(command_to_run)}")
                    
                    try:
                        p = subprocess.run(command_to_run, cwd=command_cwd, check=True)
                        print("Command executed successfully.")
                    except subprocess.CalledProcessError as e:
                        print(f"Error: Command failed with exit code {e.returncode}", file=sys.stderr)
                        print(f"Stderr: {e.stderr.decode()}", file=sys.stderr)
                    except FileNotFoundError:
                        print(f"Error: Command '{command_to_run[0]}' not found. Is it in your PATH?", file=sys.stderr)
                    except Exception as e:
                        print(f"An unexpected error occurred: {e}", file=sys.stderr)
    except KeyboardInterrupt:
        print("\nMonitoring stopped by user.")
    except Exception as e:
        print(f"An error occurred during monitoring: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()