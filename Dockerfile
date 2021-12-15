FROM ruby:2.6

# Add user docker, we won't user root
RUN addgroup --gid 1000 docker && useradd -g 1000 -u 1000 -s /bin/bash -m docker \
	&& mkdir /home/docker/app \
	&& chown -R docker:docker /home/docker

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ADD --chown=docker:docker Gemfile /tmp
# RUN cd /tmp && gem install bundler && bundle install && rm -f Gemfile Gemfile.lock && cd /
USER docker
RUN cd /tmp && gem install bundler && bundle install && cd /

WORKDIR /home/docker/app


CMD ["/bin/bash"]
