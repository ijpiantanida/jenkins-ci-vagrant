FROM jenkins:1.625.3

USER root
RUN apt-get update \
      && apt-get install -y sudo python-openssl \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

#Install gcloud tools
RUN wget -P /tmp/ https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-0.9.89-linux-x86_64.tar.gz \
  && tar -xzf /tmp/google-cloud-sdk-0.9.89-linux-x86_64.tar.gz -C /usr/lib/ \
  && ln -s /usr/lib/google-cloud-sdk/bin/gcloud /usr/bin/gcloud

COPY /keys/* /tmp/keys/

#Authenticate gcloud
COPY /scripts/authenticate_gcloud.sh /tmp/
ENV CLOUDSDK_PYTHON_SITEPACKAGES=1
RUN chmod +x /tmp/authenticate_gcloud.sh && sh /tmp/authenticate_gcloud.sh
 
USER jenkins
