# Base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy dependency list and install packages
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY app/ .

# Expose Flask port
EXPOSE 5000

# Run app
CMD ["python", "app.py"]

