FROM "centos:8"

# Update system packages and install dependencies
RUN yum update
RUN yum install -y ruby \ 
    && gem install bundler

# Prepare project folder structure
RUN mkdir -p /opt/hello-world
COPY ./opt/hello-world/ /opt/hello-world

# Initialise project
WORKDIR /opt/hello-world
RUN bundle install

# Run webserver
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "--port", "8080"]
EXPOSE 8080

# Change user to nobody
USER nobody