FROM node:10.15.3-stretch-slim

RUN 	yarn global add @vue/cli && \
	yarn global add @vue/cli-service-global && \
	rm -rf /usr/local/share/.cache && \
	rm -rf /tmp/*

CMD	[ "/bin/bash" ]

