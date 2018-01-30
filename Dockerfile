FROM vcatechnology/ubuntu-ci
MAINTAINER VCA Technology <developers@vcatechnology.com>

# Build-time metadata as defined at http://label-schema.org
ARG PROJECT_NAME
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="$PROJECT_NAME" \
      org.label-schema.description="An up-to-date Ubuntu Linux image with packages to check the format and linting of the testing scripts" \
      org.label-schema.url="https://www.ubuntu.com/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/vcatechnology/docker-testing" \
      org.label-schema.vendor="VCA Technology" \
      org.label-schema.version=$VERSION \
      org.label-schema.license=MIT \
      org.label-schema.schema-version="1.0"

# Install packages
RUN sudo vca-install-package \
  build-essential \
  libcairo2-dev \
  libcairo2 \
  gobject-introspection \
  git \
  python-pip \
  pylint \
  python-pytest \
  python-sphinx \
  python-sphinx-rtd-theme \
  python-gobject \
  python-gi

# Install pip packages
RUN pip install --user pytest-ordering yapf requests

