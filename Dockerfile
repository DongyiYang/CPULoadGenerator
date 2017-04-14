FROM ubuntu

# Update
RUN apt-get -y update

RUN apt-get -y install python-matplotlib
RUN apt-get -y install python-psutil
RUN apt-get -y install python-twisted

# Bundle app source
COPY utils/Controller.py /src/load/Controller.py
COPY utils/Monitor.py /src/load/Monitor.py
COPY utils/closedLoopActuator.py /src/load/closedLoopActuator.py
COPY utils/openLoopActuator.py /src/load/openLoopActuator.py
COPY CPULoadGenerator.py /src/load/CPULoadGenerator.py

ENTRYPOINT ["/src/load/CPULoadGenerator.py"] 
