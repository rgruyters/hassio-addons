ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

ARG CONSUL_URL=https://releases.hashicorp.com/consul
ARG CONSUL_VERSION
ARG CONSUL_ARCH=$BUILD_ARCH

ENV LANG C.UTF-8

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apk add --no-cache jq unzip \
  && [ $BUILD_ARCH = "armhf" -o $BUILD_ARCH = "armv7" ] && CONSUL_ARCH=arm || true \
  && wget ${CONSUL_URL}/$CONSUL_VERSION/consul_${CONSUL_VERSION}_linux_$CONSUL_ARCH.zip -O /consul.zip \
  && unzip -x /consul.zip && rm /consul.zip \
  && chmod +x /consul \
  && mkdir -p -m 750 /var/lib/consul \
  && chown 999 /var/lib/consul

COPY rootfs /

LABEL \
  io.hass.name="Consul Agent" \
  io.hass.description="Use Consul Agent to advertise Home Assistant as a service" \
  io.hass.arch="${BUILD_ARCH}" \
  io.hass.type="addon" \
  io.hass.version="${BUILD_VERSION}" \
  io.hass.arch="${BUILD_ARCH}" \
  maintainer="Robin Gruyters <hallo@grtrs.nl>" \
  org.label-schema.description="Use Consul Agent to advertise Home Assistant as a service" \
  org.label-schema.build-date=${BUILD_DATE} \
  org.label-schema.name="Consul Agent" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.url="https://github.com/rgruyters/addon-consul-agent" \
  org.label-schema.usage="https://github.com/rgruyters/addon-consul-agent/tree/master/README.md" \
  org.label-schema.vcs-ref=${BUILD_REF} \
  org.label-schema.vcs-url="https://github.com/rgruyters/addon-consul-agent" \
  org.label-schema.vendor="Community Hass.io Add-ons"
