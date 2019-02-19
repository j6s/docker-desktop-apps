FROM j6s/x11-base

RUN apt-get update && \
    apt-get -y install curl gpg && \
    curl https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y install google-chrome-stable

USER user
CMD google-chrome --no-sandbox
