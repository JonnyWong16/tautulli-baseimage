FROM python:3.8-slim

LABEL maintainer="Tautulli"

RUN \
  apt-get -q -y update --no-install-recommends && \
  apt-get install -q -y --no-install-recommends \
    build-essential libssl-dev libffi-dev \
    curl \
    gosu && \
  curl https://sh.rustup.rs -sSf | sh -s -- -y && \
  pip install --no-cache-dir --upgrade pip && \
  pip install --no-cache-dir --upgrade \
    pycryptodomex \
    pyopenssl && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get purge -y --auto-remove \
    build-essential libssl-dev libffi-dev && \
  rustup self uninstall -y
