# Use the official Python image as a base image
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /usr/src/flask-app

# Copy the requirements.txt file into the container
COPY requirements.txt ./

# Install dependencies inside the container
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /usr/src/flask-app

# Expose port 8501 (as you're using this for the waitress server)
# EXPOSE 8501

# Command to run the app using waitress
CMD ["waitress-serve", "--port=8501", "app:app"]

