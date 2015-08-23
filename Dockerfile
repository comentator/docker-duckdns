FROM phusion/baseimage:0.9.17

MAINTAINER David Coppit <david@coppit.org>

VOLUME ["/config"]

# Add dynamic dns script
ADD duck.sh /root/duckdns/duck.sh
RUN chmod +x /root/duckdns/duck.sh

# Create template config file
ADD duck.conf /root/duckdns/duck.conf

# Run duck.sh immediately when the container starts, and start cron for subsequent runs
CMD /root/duckdns/duck.sh
