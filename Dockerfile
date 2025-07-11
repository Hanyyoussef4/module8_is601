# Use the official slim Python base image
FROM python:3.10-slim

# Don’t write .pyc files and don’t buffer stdout/stderr
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# 1) Install OS-level build dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      gcc \
      python3-dev \
      libssl-dev \
      curl && \
    rm -rf /var/lib/apt/lists/*

# 2) Create a non-root user to run our app
RUN groupadd -r appgroup && \
    useradd -r -g appgroup appuser

# 3) Copy & install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
 && pip install --no-cache-dir --upgrade \
    setuptools>=78.1.1 \
    h11>=0.16.0

# 4) Copy app code
COPY . .

# 5) Fix permissions
RUN chown -R appuser:appgroup /app

# 6) Switch to the non-root user
USER appuser

# 7) Simple healthcheck for container platforms
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8000/health || exit 1

# 8) Launch the app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "4"]
