FROM debian

COPY build /tmp
RUN chmod 755 /tmp/build
RUN /tmp/build

# gettext-base for envsubst
# as alternative https://github.com/a8m/envsubst could be used
RUN apt update && \
	apt install -y awscli gettext-base && \
	apt autoclean -y &&  \
	apt autoremove -y &&  \
	rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
