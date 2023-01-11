#!/usr/bin/env python3


"""Prints log lines in the last hour of day, primarily meant for monitoring
"""

import argparse
from datetime import datetime, timedelta
import os.path
import re

def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("logfiles", nargs='+', help='The log files to search for')
    parser.add_argument("-l", "--last", default ="hour", choices = ["hour", "day"],
                        help="Show messages in last hour or day")
    parser.add_argument("-m", "--multi-line", action='store_true', default=False,
                        help="For multiline messages, print all lines instead of just the first one")
    return parser.parse_args()


def process_logfile(logfile, datetime_ref, args):
    with open(logfile, "r", errors="replace") as input:
        year = os.path.basename(logfile).split(".")[1]
        last_line_printed = False
        for line in input:
            line_match = re.search(r"^(\w{3}\s+\d+\s+\d\d:\d\d:\d\d)\s", line)
            if line_match:
                timestamp = year + " " + line_match.group(1)
                datetime_line = datetime.strptime(timestamp, "%Y %b %d %H:%M:%S")
                if datetime_line >= datetime_ref:
                    print(line, end="")
                    last_line_printed = True
                else:
                    last_line_printed = False
            elif args.multi_line and last_line_printed:
                print(line, end="")

def main():
    args = parse_args()

    if args.last == "hour":
        datetime_ref = datetime.now() - timedelta(hours=1)
    else:
        datetime_ref = datetime.now() - timedelta(days=1)

    for logfile in args.logfiles:
        process_logfile(logfile, datetime_ref, args)


if __name__ == "__main__":
    main()
