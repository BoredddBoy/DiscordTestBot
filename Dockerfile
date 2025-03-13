FROM ubuntu:20.04

RUN apt-get update && apt-get install -y curl git
RUN curl -L https://github.com/luvit/luvit/releases/download/2.14.0/luvit-linux -o /usr/local/bin/luvit \
    && chmod +x /usr/local/bin/luvit
RUN curl -L https://raw.githubusercontent.com/luvit/lit/master/get-lit.sh | bash \
    && mv lit /usr/local/bin/

WORKDIR /app
COPY . .

RUN lit install SinisterRectus/discordia

CMD ["luvit", "bot.lua"]
