
FROM python:3.12-slim


WORKDIR /app


COPY src/app/requirements.txt .


RUN pip install --no-cache-dir -r requirements.txt


COPY src/app/ .


ENV FLASK_APP=flaskr
ENV FLASK_ENV=production


RUN flask init-db

EXPOSE 5000


CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

