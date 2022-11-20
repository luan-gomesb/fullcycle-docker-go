FROM  golang:1.18-bullseye AS stage
COPY . .
RUN go build -ldflags "-s -w" full_cycle.go

FROM hello-world
WORKDIR /app
COPY --from=stage /go/full_cycle .
CMD  [ "./full_cycle" ]