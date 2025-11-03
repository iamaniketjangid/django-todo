# Use a stable Python version compatible with Django 3.2
FROM python:3.11

# Set working directory inside the container
WORKDIR /data

# Install system dependencies (optional but safe)
RUN apt-get update && apt-get install -y build-essential

# Install Django and required Python packages
RUN pip install --no-cache-dir django==3.2 setuptools

# Copy project files into the container
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose the Django development server port
EXPOSE 8000

# Default command to run Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
