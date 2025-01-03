# Use Python 3.8 as the base image
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Copy the requirements file and install DBT
COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt


# Copy DBT project files into the container
COPY dbt/requirements.txt /app/requirements.txt


# Set environment variable for DBT profiles (optional)
ENV DBT_PROFILES_DIR=/app/profiles

# Run DBT as the default command
CMD ["dbt", "run"]
