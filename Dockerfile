# FROM python:3.9
# WORKDIR /demo
# COPY requirements.txt .
# RUN pip install -r requirements.txt
# COPY flyshare /demo
# EXPOSE 5000
# CMD python manage.py runserver 0.0.0.0:5000

FROM python:3.9
WORKDIR /demo

# Copy only the requirements file first to leverage Docker cache
COPY requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Adjust the COPY command to copy the entire flyshare folder into the Docker image
COPY flyshare /demo/flyshare

EXPOSE 5000
CMD python /demo/flyshare/manage.py runserver 0.0.0.0:5000
