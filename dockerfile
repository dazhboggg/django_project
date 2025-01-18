FROM python:3.11

ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN pip install --upgrade pip 'django-filter==22.1'
RUN pip install --upgrade pip 'Pillow==9.4.0'
RUN pip install --upgrade pip 'sqlparse==0.4.2'
RUN pip install --upgrade pip 'pytz==2022.7.1'
RUN pip install --upgrade pip 'asgiref==3.6.0'
RUN pip install --upgrade pip "djangorestframework==3.15.2"
RUN pip install --upgrade pip "django-debug-toolbar==3.8.1"
RUN pip install --upgrade pip "django==4.2"
RUN pip install --upgrade pip "poetry==1.4.2"
RUN pip install --upgrade pip "gunicorn==20.1.0"

RUN poetry config virtualenvs.create false --local
COPY pyproject.toml ./
RUN poetry install

COPY mysite .

CMD ["gunicorn", "mysite.wsgi:application", "--bind", "0.0.0.0:8000"]