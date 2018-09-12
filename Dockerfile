FROM ekidd/rust-musl-builder:stable AS rust-builder
ADD . .
RUN cargo build --release --target x86_64-unknown-linux-musl

FROM alpine:3.7
COPY --from=rust-builder /home/rust/src/target/x86_64-unknown-linux-musl/release/zeit-sample /usr/local/bin
RUN apk add --no-cache ca-certificates && update-ca-certificates
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
ENV SSL_CERT_DIR=/etc/ssl/certs
EXPOSE 3030
CMD ["zeit-sample"]