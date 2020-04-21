FROM makinacorpus/geodjango:bionic-3.7


RUN apt-get update && apt-get install -y build-essential python3-dev libpq-dev libssl-dev libffi-dev liblapack-dev gfortran libxml2-dev libxslt1-dev rabbitmq-server

RUN mkdir -p /code/src
COPY . /code/src
WORKDIR /code/src

RUN useradd -ms /bin/bash django
RUN chown -R django:django /code

USER django

COPY requirements.txt requirements.txt
RUN python3.7 -m venv /code/venv
RUN  /code/venv/bin/pip install --no-cache-dir pip setuptools wheel -U

RUN /code/venv/bin/pip3 install -r requirements.txt