import datetime
import time
import glob
import subprocess
import select
from croniter import croniter
import os

def run_tasks():
    scripts = glob.glob('/scripts/*.sh')
    for script in scripts:
        print(f"[Running: {script}]")
        process = subprocess.Popen([script], shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

        # Create a pipe set to monitor both stdout and stderr
        pipes = [process.stdout, process.stderr]
        while True:
            # Use select to wait for data to become available on any of the pipes
            readable, _, _ = select.select(pipes, [], [])
            for pipe in readable:
                # Read a line from the pipe
                line = pipe.readline()

                # If the pipe has been closed, remove it from the list
                if line == '':
                    pipes.remove(pipe)
                else:
                    # Print the line as it comes
                    print(line, end='')
            # Break the loop if both pipes are closed
            if not pipes:
                break
        # Wait for the process to finish
        process.wait()

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
