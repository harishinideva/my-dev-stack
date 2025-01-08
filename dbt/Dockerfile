# Use a Python-based image to install dbt
FROM python:3.8-slim

# Set the working directory inside the container
WORKDIR /app

# Install DBT (modify as needed based on version or other dependencies)
RUN pip install dbt

# Copy your project files into the container
COPY . /app

# Set the default command to run DBT
CMD ["dbt", "run"]
