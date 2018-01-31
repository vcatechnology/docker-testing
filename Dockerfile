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
  python3 \
  python3-pip \
  python3-gi \
  python3-gi-cairo \
  libgstreamer0.10-dev \
  libgstrtspserver-1.0-dev

# Change default python version from 2 to 3
RUN sudo unlink /usr/bin/python
RUN sudo ln -s /usr/bin/python3 /usr/bin/python

# Change default pip version from 2 to 3
RUN sudo rm /usr/bin/pip
RUN sudo ln -s /usr/bin/pip3 /usr/bin/pip

# Upgrade pip to the latest version
RUN sudo pip install --upgrade pip

# Install pip packages
RUN sudo pip install pytest-ordering yapf requests pytest pylint sphinx sphinx_rtd_theme PyGObject


