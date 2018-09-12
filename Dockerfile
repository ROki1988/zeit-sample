FROM rust:1.28.0-slim-stretch
ADD . /source
WORKDIR /source

EXPOSE 3030

RUN cargo build --release
CMD cargo run --release