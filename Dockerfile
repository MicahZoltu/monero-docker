FROM ubuntu:18.04

RUN apt-get update \
	&& apt-get install --yes wget

WORKDIR /app

RUN wget -O - https://downloads.getmonero.org/cli/monero-linux-x64-v0.16.0.3.tar.bz2 | tar --extract --bzip2 --strip-components=1 --file=-
RUN shasum -a 256 monero-linux-x64-v0.16.0.3.tar.bz2 # should be cb67ad0bec9a342b0f0be3f1fdb4a2c8d57a914be25fc62ad432494779448cc3

EXPOSE 18080
EXPOSE 18081
VOLUME [ "/app/data" ]

ENTRYPOINT [ "/app/monerod", "--data-dir", "/app/data", "--rpc-bind-ip", "0.0.0.0", "--confirm-external-bind", "--restricted-rpc", "--non-interactive" ]
