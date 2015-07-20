FROM pypy:2-2.5.0
MAINTAINER Praekelt Foundation <dev@praekeltfoundation.org>
COPY . /var/unicore-cms/
WORKDIR /var/unicore-cms/
RUN pip install -e .
EXPOSE 8080
