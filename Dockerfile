FROM python:3.7.9-alpine
ENV PYTHONBUFFERED 1
WORKDIR /app
RUN apk update \
    && apk add postgresql-dev zlib-dev build-base jpeg-dev libxml2-dev libxslt-dev postgresql-client libffi-dev nodejs nodejs-npm

COPY config/requirements.txt .
RUN python -m pip install -U --force-reinstall pip
RUN pip install --no-cache-dir -r requirements.txt
COPY src /app

CMD python src/app.py