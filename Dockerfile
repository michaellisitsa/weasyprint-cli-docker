FROM ubuntu:20.04


ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    # WeasyPrint dependencies
    apt-get install -y python3-pip python3-cffi python3-brotli libpango-1.0-0 libharfbuzz0b libpangoft2-1.0-0 fonts-open-sans fonts-noto-core && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install WeasyPrint
ENV POETRY_VIRTUALENVS_IN_PROJECT=true
RUN pip3 install poetry==1.4.2
COPY poetry.lock pyproject.toml /usr/local/lib/weasyprint/
RUN cd /usr/local/lib/weasyprint && \
    poetry install && \
    ln -s $(poetry run which weasyprint) /usr/local/bin/weasyprint