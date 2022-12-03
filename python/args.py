from datetime import datetime
import argparse

def get_args():
    # TODO: Add --start-date, --end-date and --output arguments
    parser = argparse.ArgumentParser()
    parser.add_argument("--start-date")
    parser.add_argument("--end-date")
    parser.add_argument("--output")
    args = parser.parse_args()

    # TODO: Convert dates to datetime.date objects
    args.start_date = datetime.strptime(args.start_date, '%Y-%m-%d').date()
    args.end_date = datetime.strptime(args.end_date, '%Y-%m-%d').date()
    return args
