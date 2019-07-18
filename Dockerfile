FROM ubuntu:18.04

RUN apt-get update \
	&& apt-get install --yes wget

WORKDIR /app

RUN wget -O - https://dlsrc.getmonero.org/cli/monero-linux-x64-v0.14.1.0.tar.bz2 | tar --extract --gzip --strip-components=2 --file=-

EXPOSE 18080
EXPOSE 18081
VOLUME [ "/app/data" ]

ENTRYPOINT [ "/app/monerod", "--data-dir", "/app/data", "--rpc-bind-ip", "0.0.0.0", "--confirm-external-bind", "--restricted-rpc", "--non-interactive" ]
