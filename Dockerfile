FROM ubuntu
MAINTAINER Matt Koski <maccam912@gmail.com>
RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install vim python git build-essential wget screen tmux curl subversion mongodb -y

RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

RUN mkdir /Development
RUN cd /Development && git clone git://github.com/joyent/node

RUN cd /Development/node && ./configure && make && make install
RUN rm -rf /Development/node
RUN chmod 777 -R /Development

EXPOSE 80:80
EXPOSE 443:443
EXPOSE 3000:3000

RUN npm install -g bower grunt-cli yo mediacenterjs && cd mediacenterjs && node server
