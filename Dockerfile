FROM python:3.10

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt
RUN python3.10 -m pip install --no-cache-dir --upgrade pip
RUN python3.10 -m pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./application /code/application
COPY ./main.py /code/

ENTRYPOINT ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000", "--no-access-log", "--workers", "8"]
