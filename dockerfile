FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  redis \
  firefox-esr \
  graphviz \
  imagemagick \
  librsvg2-bin \
  fonts-dejavu \
  shellcheck \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD ["python3", "searx/webapp.py"]
