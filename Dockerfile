FROM node:lts-stretch

RUN	echo "deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib" > /etc/apt/sources.list \
		&& echo "deb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib" >> /etc/apt/sources.list \
		&& echo "deb http://mirrors.aliyun.com/debian-security stretch/updates main" >> /etc/apt/sources.list \
		&& echo "deb-src http://mirrors.aliyun.com/debian-security stretch/updates main" >> /etc/apt/sources.list \
		&& echo "deb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list \
		&& echo "deb-src http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list \
		&& echo "deb http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list \
		&& echo "deb-src http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list \
		&& echo "deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/ /" > /etc/apt/sources.list.d/shells:fish:release:3.list \
		&& wget -nv https://download.opensuse.org/repositories/shells:fish:release:3/Debian_9.0/Release.key -O Release.key \
		&& apt-key add - < Release.key && rm Release.key \
		&& apt-get update \
		&& apt-get install -y \
					git \
					vim-nox \
					fish && \
	rm -rf /var/lib/apt/lists/*

RUN npm config set registry https://registry.npm.taobao.org \
		&& npm set disturl https://npm.taobao.org/dist \
		&& npm install -g @vue/cli \
		&& npm install -g @vue/cli-service-global

CMD	[ "fish" ]

