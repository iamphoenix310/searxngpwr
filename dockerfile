FROM python:3.11-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-venv redis firefox-esr graphviz imagemagick librsvg2-bin fonts-dejavu shellcheck \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy code
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose the app port
EXPOSE 8080

# Run SearXNG with uWSGI or gunicorn or whatever your entrypoint is
CMD ["python3", "searx/webapp.py"]
