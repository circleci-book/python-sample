FROM python:3.8

RUN apt update && apt -y install default-mysql-client

RUN pip install pipenv

ENV APP_ROOT /circleci-sample

WORKDIR $APP_ROOT

ADD requirements.txt $APP_ROOT
ADD Pipfile $APP_ROOT
ADD Pipfile.lock $APP_ROOT
RUN pipenv install

ADD . $APP_ROOT
