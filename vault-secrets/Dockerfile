ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG BUILD_VERSION

ARG HASHICORP_RELEASES=https://releases.hashicorp.com
ARG CT_VERSION=0.19.5
ARG CT_ARCH=arm
ARG CONSUL_TEMPLATE=${HASHICORP_RELEASES}/consul-template/$CT_VERSION/consul-template_${CT_VERSION}_linux_${CT_ARCH}.tgz

ENV LANG C.UTF-8

LABEL \
  io.hass.name="Vault Secrets" \
  io.hass.description="Use Vault to store and retrieve secrets" \
  io.hass.arch="${BUILD_ARCH}" \
  io.hass.type="addon" \
  io.hass.version="${BUILD_VERSION}" \
  io.hass.arch="${BUILD_ARCH}" \
  maintainer="Robin Gruyters <robin.gruyters@snow.nl>"

RUN apk add --no-cache jq \
  && wget -O - $CONSUL_TEMPLATE | tar -xzf - -C / \
  && chmod +x /consul-template

COPY ./hassio_secrets.ctmpl /

COPY ./run.sh /
RUN chmod +x ./run.sh

VOLUME [ "/config" ]

CMD [ "/run.sh" ]
