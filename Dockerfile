FROM phusion/baseimage:0.9.11

MAINTAINER David Coppit <david@coppit.org>

VOLUME ["/config"]

# Add dynamic dns script
ADD duck.sh /root/duckdns/duck.sh
RUN chmod +x /root/duckdns/duck.sh

# Create template config file
ADD duck.conf /root/duckdns/duck.conf

# Add our crontab file
ADD duckcron.conf /root/duckdns/duckcron.conf

# Incorporate the crontab file
RUN crontab /root/duckdns/duckcron.conf

# Run duck.sh immediately when the container starts, and start cron for subsequent runs
CMD /root/duckdns/duck.sh && cron && sleep infinity
