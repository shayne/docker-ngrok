FROM gliderlabs/alpine:3.1
MAINTAINER  Shayne Sweeney <shaynesweeney@me.com>

RUN apk --update add curl
RUN curl -Lk 'https://dl.ngrok.com/ngrok_2.0.19_linux_amd64.zip' > ngrok.zip
RUN unzip ngrok.zip -d /bin && rm -f ngrok.zip
RUN echo 'inspect_addr: 0.0.0.0:4040' > /.ngrok
ADD ngrok_discover /bin/ngrok_discover
RUN chmod +x /bin/ngrok_discover

EXPOSE 4040

ENTRYPOINT ["/bin/ngrok_discover"]
