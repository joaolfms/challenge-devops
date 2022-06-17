import schedule
import os
import time

os.system("chmod +x requirements.sh")
os.system('./requirements.sh')

def automate():
    os.system("chmod +x monitoramento.sh")
    os.system('./monitoramento.sh')
    print("Monitoramento executado")

schedule.every(5).seconds.do(automate)

while 1:
    schedule.run_pending()
    time.sleep(1)