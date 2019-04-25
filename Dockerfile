FROM ubuntu
RUN set -ex \
    && apt-get update \
    && apt-get install -y -qq --no-install-recommends ca-certificates curl wget apt-utils jq

# install qtum binaries
RUN set -ex \
    && echo `curl -s https://api.github.com/repos/UnitaNetwork/unita/releases/latest | jq -r ".assets[] | select(.name | test(\"x86_64-linux-gnu.tar.gz\")) | .browser_download_url"` > /tmp/unita_url \
    && UNITA_URL=`cat /tmp/unita_url` \
    && UNITA_DIST=$(basename $UNITA_URL) \
    && wget -O $UNITA_DIST $UNITA_URL \
	&& tar -xzvf $UNITA_DIST -C /usr/local --strip-components=1 \
	&& rm /tmp/unita*

# create data directory
ENV UNITA_DATA /data
RUN mkdir $UNITA_DATA \
	&& ln -sfn $UNITA_DATA /root/.unita \
VOLUME /data

EXPOSE 33669 23889 
CMD ["unitad"]
