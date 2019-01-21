FROM node:11-alpine as builder
WORKDIR /app
COPY ./ /app/
RUN yarn && yarn build

FROM alpine:3.8
WORKDIR /app
RUN set -euo pipefail; \
    wget https://github.com/m3ng9i/ran/releases/download/v0.1.3/ran_linux_amd64.zip; \
    unzip ran_linux_amd64.zip; \
    mv ran_linux_amd64 /usr/local/bin/ran
COPY --from=builder /app/dist/ /app/dist/
ENV PORT 8080
CMD ["sh", "-c", "exec ran -r /app/dist/ -p ${PORT}"]
