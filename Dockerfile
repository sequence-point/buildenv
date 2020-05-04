FROM debian:buster

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		ca-certificates \
		clang \
		curl \
		wget \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir /build2-build \
	&& cd /build2-build \
	&& curl -sSfO https://download.build2.org/0.12.0/build2-install-0.12.0.sh \
	&& sh build2-install-0.12.0.sh --yes --trust yes --cxx clang++ \
	&& cd / \
	&& rm -rf /build2-build

RUN b --version
