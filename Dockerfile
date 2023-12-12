# Use Python as a parent image
FROM python:3.9

# Set the working directory to /code
WORKDIR /code

# Copy the requirements file into the container at /code
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy the contents of the local app directory to the /code/app directory in the container (Changed this from previous Dockerfile)
COPY app/ ./app

# Set the working directory to /code/app where main.py is located
WORKDIR /code/app

# Run app when the container launches
CMD uvicorn main:app --host 0.0.0.0 --port $PORT