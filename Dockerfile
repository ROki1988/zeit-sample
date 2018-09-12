FROM alpine:3.5
EXPOSE 3030
RUN mkdir /app
WORKDIR /app
COPY ./target/release/zeit-sample /app/zeit-sample
RUN chmod 755 /app/zeit-sample
CMD ["/app/zeit-sample"]