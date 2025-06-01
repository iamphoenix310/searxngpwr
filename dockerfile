# Start from a lightweight Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y build-essential git libxslt1-dev libxml2-dev libffi-dev libssl-dev libjpeg-dev zlib1g-dev \
    redis firefox-esr graphviz imagemagick librsvg2-bin fonts-dejavu shellcheck

# Copy everything into container
COPY . /app

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Expose the default port used by SearXNG
EXPOSE 8080

# Start the app
CMD ["python", "-m", "searx.webapp"]
