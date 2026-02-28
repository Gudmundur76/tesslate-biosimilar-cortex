FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
# In a real scenario, you'd have a requirements.txt
# For now, we'll install the core ones manually
RUN pip install fastapi uvicorn pydantic requests

# Copy the project files
COPY . .

# Set environment variables
ENV PYTHONPATH=/app
ENV DATABASE_URL=postgresql://user:password@db:5432/tesslate_biosimilar

# Expose the API port
EXPOSE 8000

# Start the application
CMD ["uvicorn", "src.api.main:app", "--host", "0.0.0.0", "--port", "8000"]
