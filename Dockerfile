# Menggunakan image dasar Node.js versi 14.21 berbasis Alpine Linux
FROM node:14.21-alpine as builder

# Menentukan working directory di dalam container
WORKDIR /app

# Menyalin file package.json dan package-lock.json
COPY package*.json ./

# Menginstall seluruh dependency Node.js
RUN npm install

# Menyalin seluruh source code aplikasi ke container
COPY . .

# Menjalankan proses build aplikasi frontend
RUN npm run build

# Memberitahu Docker bahwa aplikasi menggunakan port 8000
EXPOSE 8000

# Menjalankan aplikasi menggunakan npm serve
CMD [ "npm", "run", "serve" ]
