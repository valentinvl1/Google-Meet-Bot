FROM python:3.10-slim

WORKDIR /app

COPY . .

# Installer PortAudio pour sounddevice
RUN apt-get update && apt-get install -y \
    libportaudio2 \
    libportaudiocpp0 \
    portaudio19-dev \
    libasound-dev \
    libsndfile1-dev \
    ffmpeg curl xvfb

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "join_google_meet.py"]
