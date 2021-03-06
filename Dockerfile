FROM alpine:latest
RUN apk add --no-cache python3 build-base python3-dev libffi-dev libressl-dev py-cryptography && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip && \
    pip3 install --upgrade setuptools && \
    rm -r /root/.cache
COPY ./app/requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt
RUN mkdir -p /opt/webapp
COPY . /opt/webapp/
WORKDIR /opt/webapp
EXPOSE 80
CMD ["python3", "app.py"]
