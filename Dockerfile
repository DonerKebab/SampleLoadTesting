FROM nginx

MAINTAINER DonerKebab

# Install required packages and remove the apt packages cache when done.
RUN apt-get -y update && apt-get install -y \
	python \
	python-dev \
	python-setuptools \
	supervisor \
	python \
	python-dev \
    python-pip \
    apache2-utils \
	&& rm -rf /var/lib/apt/lists/*

#RUN export TERM=xterm

# setup all the configfiles
COPY nginx_auth.conf /etc/nginx/.htpasswd
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisor.conf /etc/supervisor/conf.d/

# COPY requirements.txt and RUN pip install BEFORE adding the rest of your code, this will cause Docker's caching mechanism
# to prevent re-installinig (all your) dependencies when you made a change a line or two in your app.
COPY app/requirements.txt /test/app/
RUN pip install -r /test/app/requirements.txt

# add (the rest of) our code
COPY . /test/

# Run supervisord in the foreground.
CMD ["supervisord", "-n"]

EXPOSE 80



