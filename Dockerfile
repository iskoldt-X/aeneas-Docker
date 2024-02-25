FROM iskoldt/numpy:latest

# Install additional system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    espeak espeak-data libespeak1 libespeak-dev \
    festival \
    flac libasound2-dev libsndfile1-dev vorbis-tools \
    libxml2-dev libxslt-dev zlib1g-dev \
    git file htop screen vim unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install additional Python dependencies, excluding numpy
RUN pip3 --no-cache-dir install boto3 requests tgt yt-dlp Pillow
RUN pip3 --no-cache-dir install aeneas

# Setup working directory
WORKDIR /app
COPY ./ /app/

ENV PYTHONIOENCODING=UTF-8
