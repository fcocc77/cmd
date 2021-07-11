from time import sleep
import psutil
import os
import time

current_freq = 0

last_change = 0

def set_frequency(freq: float, force = False):
    global current_freq, last_change

    if not force:
        if freq == current_freq:
            return

        elapsed = time.time() - last_change

        if elapsed < 7:
            return

    last_change = time.time()
    current_freq = freq

    cmd = 'cpupower frequency-set -u ' + str(freq) + 'GHz'
    os.system(cmd)


while(True):

    temp: int = psutil.sensors_temperatures()["coretemp"][0].current

    if (temp > 85):
        set_frequency(2.0, True)

    elif (temp > 80):
        set_frequency(2.5)

    elif (temp < 50):
        set_frequency(5.0)

    else:
        set_frequency(2.9)

    sleep(2)
