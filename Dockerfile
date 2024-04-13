# Stage: 01
FROM golang:1-alpine as builder
WORKDIR /app
ARG CGO_ENABLED=0 GOOS=linux
COPY go.mod go.sum ./
RUN go mod download && go mod verify
COPY . .
RUN go build -o /my-app

# Stage: 02
FROM alpine:3.19 as final
WORKDIR /
LABEL maintainer="SIFAT ULLAH" version="1.0.0"
COPY --from=builder /my-app /my-app
ENV PORT=3030
ENTRYPOINT ["/my-app"]