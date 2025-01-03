FROM dbt-labs/dbt:latest

WORKDIR /usr/app

COPY . /usr/app

RUN pip install -r requirements.txt

CMD ["dbt", "run"]

