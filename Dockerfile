#
# Dockerfile for the termpad.
#
# Robert Haines.
#
# BSD Licenced. See LICENCE for details.
#

FROM python:2.7
MAINTAINER Robert Haines <robert.haines@manchester.ac.uk>

RUN apt-get update -q \
  && DEBIAN_FRONTEND=noninteractive \
    apt-get install -qy \
    inotify-tools \
    --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && pip install --no-cache-dir inotifyx

COPY watcher /root/watcher

ENTRYPOINT ["/root/watcher", "/root/in"]
