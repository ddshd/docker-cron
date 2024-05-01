import datetime
import time
import glob
import subprocess
from croniter import croniter
import os

def run_tasks():
    scripts = glob.glob('/scripts/*.sh')
    for script in scripts:
        print(f"[Running: {script}]")
        result = subprocess.run([script], shell=True, text=True, capture_output=True)
        print("Output:", result.stdout)
        if result.stderr:
            print("Error:", result.stderr)

def schedule_tasks(cron_expression):
    base_time = datetime.datetime.now()
    iter = croniter(cron_expression, base_time)
    next_time = iter.get_next(datetime.datetime)

    while True:
        now = datetime.datetime.now()
        sleep_duration = (next_time - now).total_seconds()
        if sleep_duration > 0:
            time.sleep(sleep_duration)

        run_tasks()
        next_time = iter.get_next(datetime.datetime)

run_tasks()
cron_expression = os.getenv("CRON_SCHEDULE")
schedule_tasks(cron_expression)
