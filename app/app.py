import schedule
import os
import time

def automate():
    os.system("chmod +x monitoramento.sh")
    os.system('./monitoramento.sh')
    print("Monitoramento executado")

schedule.every(0.5).seconds.do(automate)

while 1:
    schedule.run_pending()
    time.sleep(1)