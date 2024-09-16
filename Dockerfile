# Step by step:
#
# 1. Create docker image:
# $ docker image build -t rest-cli-io .
#   - You can pass in `uid` and `gid` as `--build-arg`s if you need to change the user and group IDs.
#
# 2. Run the container: 
# $ docker run -d -p 8071:8071 rest-cli-io   
#
# Done

FROM node:18-bookworm-slim

ARG uid=1000
ARG gid=1000
ENV CONFIG_FILE=/config/rest-cli-io.conf

WORKDIR /rest-cli-io

COPY package.json ./
RUN npm install

COPY ./ ./

EXPOSE 8017

VOLUME ["/config"]

CMD node rest-cli-io
