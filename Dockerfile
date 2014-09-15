FROM dockerfile/python
RUN pip install awscli
ADD elb-sidekick.sh /bin/elb-sidekick.sh
CMD elb-sidekick.sh

