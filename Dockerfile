FROM gliderlabs/alpine:3.1
MAINTAINER  Shayne Sweeney <shaynesweeney@me.com>

RUN apk --update add curl
RUN curl -Lk 'https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk' > glibc-2.21-r2.apk
RUN apk add --allow-untrusted glibc-2.21-r2.apk && rm glibc-2.21-r2.apk
RUN curl -Lk 'https://dl.ngrok.com/ngrok_2.0.19_linux_amd64.zip' > ngrok.zip
RUN unzip ngrok.zip -d /bin && rm -f ngrok.zip
ADD ngrok_discover /bin/ngrok_discover
RUN chmod +x /bin/ngrok_discover

EXPOSE 4040

ENTRYPOINT ["/bin/ngrok_discover"]
