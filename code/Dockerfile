# pull official base image
FROM python:3.9.6-alpine

# set work directory
WORKDIR /usr/src/app

# set environment variables
#Prevents Python from writing pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1 
#Prevents Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy entrypoint.sh
COPY ./scripts/entrypoint.sh .

# copy project
COPY . .

# CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]



# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]