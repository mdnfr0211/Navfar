FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y && apt install net-tools -y
RUN apt-get -y install build-essential python3.6 python3-pip libssl-dev git vim

RUN mkdir /opt/elastalert 
WORKDIR /opt/elastalert/

RUN git clone https://github.com/Yelp/elastalert.git .
RUN pip3 install elastalert && pip3 install "setuptools>=11.3" && python3 setup.py install && pip3 install "elasticsearch>=5.0.0" && pip3 install -U PyYAML
RUN pip3 install supervisor
RUN rm -rf config.yaml.example example_rules supervisord.conf.example

RUN mkdir /opt/elastalert/elastalert-rules

COPY config.yaml elastalert_supervisord.conf ./
COPY rules/* ./elastalert-rules/
