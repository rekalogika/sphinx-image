FROM docker.io/sphinxdoc/sphinx:7.3.7

WORKDIR /docs

ADD requirements.txt /
RUN set -eux ; \
	pip3 install -r /requirements.txt ; \
	apt-get update && apt-get install -y curl ; \
	curl -L https://raw.githubusercontent.com/riboseinc/plantuml-install/master/ubuntu.sh | bash ; \
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false ; \
	rm -rf /var/lib/apt/lists/*; \
	true