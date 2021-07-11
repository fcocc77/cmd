from time import sleep
import psutil
import os
from sys import argv


current_freq = 0


def set_frequency(freq: float):
    global current_freq

    if freq == current_freq:
        return

    current_freq = freq

    cmd = 'cpupower frequency-set -u ' + str(freq) + 'GHz'
    os.system(cmd)


while(True):

    temp: int = psutil.sensors_temperatures()["coretemp"][0].current

    if (temp > 85):
        set_frequency(2.0)

    if (temp > 80):
        set_frequency(2.5)

    elif (temp > 75):
        set_frequency(2.9)

    elif (temp < 50):
        set_frequency(5.0)

    sleep(2)
