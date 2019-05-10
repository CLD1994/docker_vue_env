FROM node:10.15.3-stretch-slim

RUN	echo "deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib" > /etc/apt/sources.list && \
	echo "deb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib" >> /etc/apt/sources.list && \
	echo "deb http://mirrors.aliyun.com/debian-security stretch/updates main" >> /etc/apt/sources.list && \
	echo "deb-src http://mirrors.aliyun.com/debian-security stretch/updates main" >> /etc/apt/sources.list && \
	echo "deb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list && \
	echo "deb-src http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list && \
	echo "deb http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list && \
	echo "deb-src http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list && \
	echo "deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/ /" > /etc/apt/sources.list.d/shells:fish:release:3.list && \
	wget -nv https://download.opensuse.org/repositories/shells:fish:release:3/Debian_9.0/Release.key -O Release.key && \
	apt-key add - < Release.key && rm Release.key && \
	apt-get update && apt-get install -y \
					git \
					python2.7 \
					python-pip \
					vim-nox \
					fish && \
	rm -rf /var/lib/apt/lists/*

ENV	PATH=$HOME/esp/xtensa-esp32-elf/bin:$PATH \
	ADF_PATH=$HOME/esp/esp-adf \
	IDF_PATH=$HOME/esp/esp-adf/esp-idf

RUN	mkdir $HOME/esp && \
	cd $HOME/esp && \
	apt-get update && apt-get install -y \
					libbison-dev \
					libfl-dev \
					libjs-sphinxdoc \
					libjs-underscore \
					libsigsegv2 \
					libtinfo-dev \
					m4 \
					python-configparser && \ 
	curl -fsSLO --compressed "https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz" && \
	tar -xzf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && \
	rm xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && \
	git clone -b v1.0 --recursive https://github.com/espressif/esp-adf.git && \
	python2.7 -m pip install --user -r $IDF_PATH/requirements.txt

WORKDIR $HOME/esp

#RUN	yarn config set registry https://registry.npm.taobao.org/ && \
#	yarn global add @vue/cli && \
#	yarn global add @vue/cli-service-global && \
#	rm -rf /usr/local/share/.cache && \
#	rm -rf /tmp/*

CMD	[ "fish" ]

