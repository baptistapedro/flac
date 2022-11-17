FROM golang:1.19.1-buster as go-target
ADD . /flac
WORKDIR /flac/cmd/flac2wav/
RUN go build

FROM golang:1.19.1-buster
COPY --from=go-target /flac/cmd/flac2wav/flac2wav /
COPY --from=go-target /flac/testdata/*.flac /testsuite/

ENTRYPOINT []
CMD ["/flac2wav", "@@"]
