FROM pypy:2-2.6.0 
MAINTAINER Praekelt Foundation <dev@praekeltfoundation.org> 
COPY . /var/app/ 
COPY unicorecmsmnm/static/ /var/app/static/ 
WORKDIR /var/app/ 
RUN pip install --no-cache-dir -e . 
EXPOSE 5656
