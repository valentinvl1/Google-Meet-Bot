FROM python:3.10-slim

WORKDIR /app

COPY . .

# Pour l'enregistrement audio
RUN apt-get update && apt-get install -y ffmpeg curl xvfb

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "join_google_meet.py"]
