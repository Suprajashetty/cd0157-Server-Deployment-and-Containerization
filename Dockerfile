FROM python:stretch

COPY . /app
WORKDIR /app

RUN python -m pip install --proxy=http://proxy-ap.shell.com:80 pyjwt==1.7.1
RUN python -m pip install --proxy=http://proxy-ap.shell.com:80 flask==2.1.0
RUN python -m pip install --proxy=http://proxy-ap.shell.com:80 gunicorn==20.0.4
RUN python -m pip install --proxy=http://proxy-ap.shell.com:80 pytest==6.2.2

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]

