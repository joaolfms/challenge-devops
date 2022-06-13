# Utilizando uma linguagem de script à sua escolha, construa um projeto (servido através do nginx) que possa relatar 
# estatísticas operacionais básicas sob a forma de um objeto JSON.
# As estatísticas devem incluir (como mínimo):
# 
# Carga actual da CPU, tempo de espera e utilização de memória (opcionalmente reportado como slab, cache, RSS, etc.)
# Se existem actualizações pendentes (opcionalmente, reportando actualizações de segurança independentemente)
# Utilização actual do disco e desempenho de leitura/escrita
# 
# O resultado final pode incluir quaisquer outras estatísticas que considere importantes para efeitos de monitorização do servidor. 
# Você pode considerar a possibilidade de construir o script em cima do projeto dstat.


import psutil
import os
  
# Getting all memory using os.popen()
total_memory, used_memory, free_memory = map(
    int, os.popen('free -t -m').readlines()[-1].split()[1:])
  
# Memory usage
print("RAM memory % used:", round((used_memory/total_memory) * 100, 2))