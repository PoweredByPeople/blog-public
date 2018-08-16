FROM alpine:latest
RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade setuptools && \
    rm -r /root/.cache
COPY ./app/requirements.txt /tmp/requirements.txt
RUN pip3 install -qr /tmp/requirements.txt
RUN mkdir -p /opt/webapp
COPY . /opt/webapp/
WORKDIR /opt/webapp
EXPOSE 80
CMD ["python3", "app.py"]
