## We specify the base image we need for our
## go application
FROM golang:latest
## We create an /app directory within our
## image that will hold our application source
## files
RUN mkdir /app
## We copy everything in the root directory
## into our /app directory
ADD . /app
## We specify that we now wish to execute 
## any further commands inside our /app
## directory
WORKDIR /app
## we run go build to compile the binary
## executable of our Go program
RUN apt update && apt install -y libvips-dev
# RUN apk add --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community --repository http://dl-3.alpinelinux.org/alpine/edge/main vips-dev
RUN go mod download
# RUN go run main.go
RUN go build -o main .

EXPOSE 3000

## Our start command which kicks off
## our newly created binary executable
CMD ["/app/main"]