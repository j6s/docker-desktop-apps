FROM j6s/x11-base

RUN apt-get update && \
    apt-get -y install apt-transport-https gpg curl && \
    echo 'deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main' >> /etc/apt/sources.list && \
    curl -L https://packagecloud.io/slacktechnologies/slack/gpgkey | apt-key add - && \
    apt-get update && \
    apt-get -y install slack-desktop

USER user
CMD slack
