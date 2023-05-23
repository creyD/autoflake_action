FROM python:3.11.3-slim-bullseye

RUN apt update && apt install -y --no-install-recommends bash git openssh python3 python3-pip

RUN pip install --no-cache-dir -q --upgrade pip
RUN pip install --no-cache-dir -q autoflake

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
