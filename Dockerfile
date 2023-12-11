# Use Python as a parent image
FROM python:3.9

# Set the working directory to /code
WORKDIR /code

# Copy the requirements file into the container at /code
COPY requirements.txt /code/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy the contents of the local app directory to the /code directory in the container
COPY app/ /code/

# Run app.py when the container launches
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]