FROM ubuntu:15.10

############################################################
# library install
RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
        build-essential \
        curl \
        libcurl4-openssl-dev \
        libreadline-dev \
        libssl-dev \
        libxml2-dev \
        libxslt1-dev \
        libyaml-dev \
        zlib1g-dev \
        libmysqld-dev \
        nodejs

############################################################
# ruby install
RUN curl -O http://ftp.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz && \
    tar -zxvf ruby-2.3.0.tar.gz && \
    cd ruby-2.3.0 && \
    ./configure --disable-install-doc && \
    make && \
    make install && \
    cd .. && \
    rm -r ruby-2.3.0 ruby-2.3.0.tar.gz

RUN gem install bundler

############################################################
# nginx install
RUN curl http://nginx.org/keys/nginx_signing.key | apt-key add -
RUN sh -c "echo 'deb http://nginx.org/packages/ubuntu/ wily nginx' >> /etc/apt/sources.list"

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
        nginx

COPY ./resources/nginx/default.conf /etc/nginx/conf.d/

############################################################
# monit install
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install monit

#####################################################
# add scripts
ADD resources/monit.d /etc/monit/conf.d
ADD resources/nginx/default.conf /etc/nginx/conf.d/
ADD resources/scripts /var/scripts

############################################################
# clean apt-get files
RUN apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

VOLUME /var/data
EXPOSE 8080

CMD ["bash"]

