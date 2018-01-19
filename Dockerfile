FROM toolhouse/verify-deployment-manifest:v0.2.0
MAINTAINER Kevin Stock <kevin@toolhouse.com>

# SSL CA Root Certs
RUN apk --no-cache add ca-certificates

# Labels: http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="verify-url" \
      org.label-schema.description="Simple utility to verify HTTP status code of an endpoint and validate JSON output against a schema" \
      org.label-schema.url="https://github.com/toolhouse/verify-url" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/toolhouse/verify-url" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

WORKDIR /
ADD ./verify-url-linux_amd64 /verify-url
EXPOSE 80