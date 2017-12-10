#!/usr/bin/env python

import os
import signal
import subprocess
import random
import glob
import time 

cmd = ['/tmp/t.php']
path = os.path.expanduser('~/dotfiles/wallpaper/*')
files = glob.glob(path)
for index in random.sample(range(0, len(files)), 2) :
    cmd.append('--bg-fill')
    cmd.append(files[index])

# The os.setsid() is passed in the argument preexec_fn so
# it's run after the fork() and before  exec() to run the shell.
proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True, preexec_fn=os.setsid) 

while True:
    print("runing", proc.poll())
    time.sleep(3)  
    if proc.poll() == None:
        os.killpg(os.getpgid(proc.pid), signal.SIGTERM)  # Send the signal to all the process groups
        # proc.terminate()
        # proc.wait()


