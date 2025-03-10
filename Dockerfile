FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  wget \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install

RUN npm install yt-search

COPY . .

EXPOSE 5000

CMD ["npm", "run", "start"]
