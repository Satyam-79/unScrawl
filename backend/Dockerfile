FROM python:3.10.6-slim
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
RUN chmod 775 /app/entrypoint.sh
ENTRYPOINT [ "/app/entrypoint.sh" ]
