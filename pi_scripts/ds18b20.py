
#!/usr/bin/env python
#Nick Dos Santos July 2018
import os
import time,datetime
import requests 

dateString = '%Y/%m/%d'
API_ENDPOINT = "YOUR API END POINT"

def sensor():
    for i in os.listdir('/sys/bus/w1/devices'):
        if i != 'w1_bus_master1':
            ds18b20 = i
    return ds18b20

def read(ds18b20):
    location = '/sys/bus/w1/devices/' + ds18b20 + '/w1_slave'
    tfile = open(location)
    text = tfile.read()
    tfile.close()
    secondline = text.split("\n")[1]
    temperaturedata = secondline.split(" ")[9]
    temperature = float(temperaturedata[2:])
    celsius = temperature / 1000
    farenheit = (celsius * 1.8) + 32
    return celsius, farenheit

def loop(ds18b20):
    while True:
        if read(ds18b20) != None:
            print "Current temperature : %0.3f C" % read(ds18b20)[0]
            print "Current temperature : %0.3f F" % read(ds18b20)[1]

def countdown(n,ds18b20)    :
    start_time = n
    started = False 
    while n >= 0: 
        if n <= 0:
           countdown(10,ds18b20)
        elif n == start_time and started == False: 
           post_reading(ds18b20)
           started = True 
        if n > 0:
           time.sleep(1)
           n = n -1

def post_reading(ds18b20):
        temp = read(ds18b20)[1]
        print "Current temperature : %0.3f F" % temp
        data = {'value':temp,
        'sensor_id':'1',
        'date': datetime.datetime.now().strftime(dateString)
        }
        r = requests.post(url = API_ENDPOINT, data = data)
        print data

def kill():
    quit()

if __name__ == '__main__':
    try:
        serialNum = sensor()
        countdown(10,serialNum)
    except KeyboardInterrupt:
        kill()