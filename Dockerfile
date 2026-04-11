FROM python:3.9-slim

WORKDIR /app

# Install system dependencies (only if needed)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copy and install dependencies first (better caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app
COPY . .

# Expose FastAPI port
EXPOSE 8007

# Run with uvicorn (recommended)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8007"]