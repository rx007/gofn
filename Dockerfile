FROM fnproject/go:1.15-dev as build-stage
WORKDIR /function
WORKDIR /go/src/func/
ENV GO111MODULE=on
COPY . .
RUN cd /go/src/func/ && go build -o func
FROM fnproject/go:1.15
WORKDIR /function
COPY --from=build-stage /go/src/func/func /function/
ENTRYPOINT ["./func"]
