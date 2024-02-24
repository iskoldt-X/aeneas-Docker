FROM ubuntu:22.04

# Install system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    espeak espeak-data libespeak1 libespeak-dev \
    festival \
    build-essential \
    flac libasound2-dev libsndfile1-dev vorbis-tools \
    libxml2-dev libxslt-dev zlib1g-dev \
    python3-dev python3-pip \
    git file htop screen vim unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Python dependencies, ensuring numpy is installed before aeneas
RUN pip3 --no-cache-dir install numpy
RUN pip3 --no-cache-dir install boto3 requests tgt yt-dlp Pillow
RUN pip3 --no-cache-dir install aeneas

# Setup working directory
WORKDIR /app
COPY ./ /app/

ENV PYTHONIOENCODING=UTF-8
