FROM golang:alpine as builder

RUN mkdir /app
COPY ./main.go /app/

WORKDIR /app

RUN go mod init main && CGO_ENABLED=0 go build main.go

FROM scratch

COPY --from=builder ./app /app/

CMD [ "./app/main" ]