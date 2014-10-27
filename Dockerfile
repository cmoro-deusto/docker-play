FROM ubuntu:14.04
MAINTAINER Carlos Moro <cmoro@deusto.es>

# Set locales
RUN locale-gen en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LC_CTYPE en_GB.UTF-8

# Fix sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Create editor userspace
RUN groupadd play
RUN useradd play -m -g play -s /bin/bash
RUN passwd -d -u play
RUN echo "play ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/play
RUN chmod 0440 /etc/sudoers.d/play
RUN mkdir /home/play/Code
RUN chown play:play /home/play/Code

# Install dependencies
RUN apt-get update
RUN apt-get install -y git build-essential curl 
#RUN ppa y java8
WORKDIR /tmp
RUN wget http://downloads.typesafe.com/typesafe-activator/1.2.10/typesafe-activator-1.2.10.zip



# Install play
#RUN 

# Change user, launch bash
USER play
CMD ["/bin/bash"]

# Expose Code volume and jekyll port
VOLUME "/home/play/Code"
EXPOSE 4000
WORKDIR /home/play/Code

