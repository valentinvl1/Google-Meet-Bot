FROM python:3.10-slim

WORKDIR /app

COPY . .

# Installer dépendances système nécessaires pour:
# - Chromium (navigateur pour Selenium)
# - PortAudio (pour sounddevice)
RUN apt-get update && apt-get install -y \
    chromium chromium-driver \
    libportaudio2 \
    libportaudiocpp0 \
    portaudio19-dev \
    libasound-dev \
    libsndfile1-dev \
    ffmpeg \
    curl \
    xvfb \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Définir la variable d’environnement pour Selenium pour qu’il trouve Chromium
ENV PATH="/usr/lib/chromium:/usr/bin:$PATH"
ENV CHROME_BIN="/usr/bin/chromium"

# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Lancer le script en utilisant un affichage virtuel (nécessaire pour headless avec X11)
CMD ["xvfb-run", "-a", "python3", "join_google_meet.py"]
