FROM ubuntu:latest
MAINTAINER Charo Nuguid <me@thegeekettespeaketh.com>

RUN apt-get install wget python -y && wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && tar -xzf install-tl-unx.tar.gz

RUN mkdir -p /profiles/
COPY texlive.profile /profiles/

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/texlive/2015/bin/x86_64-linux
ENV INFOPATH /usr/local/texlive/2015/texmf-dist/doc/info
ENV MANPATH /usr/local/texlive/2015/texmf-dist/doc/man

RUN cd install-tl-*/ && ./install-tl --profile=/profiles/texlive.profile && tlmgr install texliveonfly

RUN mkdir -p /source
WORKDIR /source

ENTRYPOINT ["texliveonfly"]