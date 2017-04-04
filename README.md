# load-testing

### A sample load testing (stress test) using locust.io. It's already dockerised, just follow these step.
### It's now using a sample api of openweathermap.org, change the HOST to your endpoint.

### Requirements:
* Python
* Docker (see how to install: https://docs.docker.com/engine/installation/linux/ubuntu/#os-requirements)

### Build and run
* docker build -t load-testing .
* docker run -d -e HOST=http://samples.openweathermap.org --name load-testing -v $(pwd)/app:/test/app  -p 80:80 load-testing
* open localhost
* fill the username/pwd: admin/workhardplayhard
* enjoy


### nginx auth
* admin/workhardplayhard
