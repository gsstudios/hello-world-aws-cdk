FROM "centos:8"

# Update system packages and install dependencies
RUN yum update \
    && yum install -y curl nodejs python3 zip

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install

# Install AWS CDK
RUN npm install -g aws-cdk

# Copy project files
RUN mkdir -p /opt/cdk
COPY . /opt/cdk
WORKDIR /opt/cdk
RUN chmod -R 777 /opt/cdk

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Change user to nobody
USER nobody