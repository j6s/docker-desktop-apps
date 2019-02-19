FROM j6s/x11-base

RUN apt-get update && \
    apt-get -y install wget && \
    wget -q -O /discord.deb "https://discordapp.com/api/download?platform=linux&format=deb" && \
    dpkg -i /discord.deb || true && \
    apt-get install -f -y

USER user
CMD discord
