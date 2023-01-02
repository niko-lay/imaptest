FROM debian

COPY build /tmp
RUN chmod 755 /tmp/build
RUN /tmp/build

ENTRYPOINT ["/usr/local/bin/imaptest"]
