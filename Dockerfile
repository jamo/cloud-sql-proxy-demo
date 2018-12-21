FROM mhart/alpine-node:10 as base
WORKDIR /usr/src
RUN apk add --no-cache ca-certificates && \
  wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O /usr/bin/cloud_sql_proxy && \
  chmod +x /usr/bin/cloud_sql_proxy
COPY package.json package-lock.json /usr/src/
RUN npm ci
COPY . .
EXPOSE 3000
CMD ["./run.sh"]
