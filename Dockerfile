# Menggunakan image dasar Golang versi 1.15 berbasis Alpine Linux
FROM golang:1.15-alpine

# Menentukan working directory di dalam container
WORKDIR /go/src/github.com/dicodingacademy/karsajobs

# Setting Env 
ENV GO111MODULE=on
ENV APP_PORT=8080

# Menyalin file dependency Go ke dalam container
COPY go.mod .

# Menyalin file checksum dependency Go
COPY go.sum .

# Mengunduh seluruh dependency project Go
RUN go mod download

# Menyalin seluruh source code project ke image
COPY . .

# Membuat folder /build lalu melakukan proses build aplikasi
RUN mkdir /build; \
    go build -o /build/ ./...

# Memberitahu Docker bahwa container menggunakan port 8080
EXPOSE 8080

# Perintah default saat container dijalankan
# Menjalankan binary aplikasi bernama "web"
CMD ["/build/web"]
