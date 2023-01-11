#!/usr/bin/env python3


"""Prints log lines Apache in the last hour of day, primarily meant for monitoring
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
    return parser.parse_args()


def process_logfile(logfile, datetime_ref, args):
    with open(logfile, "r", errors="replace") as input:
        for line in input:
            line_match = re.search(r"\[(\d\d\/\w+\/\d\d\d\d:\d\d:\d\d:\d\d)\s\+\d\d\d\d\]", line)
            if line_match:
                timestamp = line_match.group(1)
                datetime_line = datetime.strptime(timestamp, "%d/%b/%Y:%H:%M:%S")
                if datetime_line >= datetime_ref:
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
