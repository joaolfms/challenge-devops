FROM ubuntu

RUN apt update -y && apt install -y python3 && apt install -y python3-pip && pip install schedule

COPY . ./app

WORKDIR /app

CMD ["python3", "app.py"]
