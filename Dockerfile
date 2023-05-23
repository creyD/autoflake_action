FROM python:3.11.3-slim-bullseye

RUN apt update && apt add --no-cache bash git openssh python3 py3-pip

RUN pip install --no-cache-dir -q --upgrade pip
RUN pip install --no-cache-dir -q autoflake

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
