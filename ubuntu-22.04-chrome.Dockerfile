ARG BASE_TAG="develop"
ARG BASE_IMAGE="core-ubuntu-jammy"
FROM kasmweb/$BASE_IMAGE:$BASE_TAG

USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
WORKDIR $HOME

### Envrionment config
ENV DEBIAN_FRONTEND noninteractive
ENV KASM_RX_HOME $STARTUPDIR/kasmrx
ENV INST_SCRIPTS $STARTUPDIR/install

### Install Tools
COPY ./scripts/ubuntu/install/tools $INST_SCRIPTS/tools/
RUN bash $INST_SCRIPTS/tools/install_tools_deluxe.sh  && rm -rf $INST_SCRIPTS/tools/

# Install Utilities
COPY ./scripts/ubuntu/install/misc $INST_SCRIPTS/misc/
RUN bash $INST_SCRIPTS/misc/install_tools.sh && rm -rf $INST_SCRIPTS/misc/

# Install Google Chrome
COPY ./scripts/ubuntu/install/chrome $INST_SCRIPTS/chrome/
RUN bash $INST_SCRIPTS/chrome/install_chrome.sh  && rm -rf $INST_SCRIPTS/chrome/

# Install Chromium
COPY ./scripts/ubuntu/install/chromium $INST_SCRIPTS/chromium/
RUN if [ "$(uname -m)" = "aarch64" ]; then bash $INST_SCRIPTS/chromium/install_chromium.sh; fi && rm -rf $INST_SCRIPTS/chromium/

# Install Sublime Text
COPY ./scripts/ubuntu/install/sublime_text $INST_SCRIPTS/sublime_text/
RUN bash $INST_SCRIPTS/sublime_text/install_sublime_text.sh  && rm -rf $INST_SCRIPTS/sublime_text/

# Install Visual Studio Code
COPY ./scripts/ubuntu/install/vs_code $INST_SCRIPTS/vs_code/
RUN bash $INST_SCRIPTS/vs_code/install_vs_code.sh  && rm -rf $INST_SCRIPTS/vs_code/

#ADD ./src/common/scripts $STARTUPDIR
RUN $STARTUPDIR/set_user_permission.sh $HOME

RUN chown 1000:0 $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

# 自定义脚本
ENV VNC_PW=password
ENV VNC_UN=ubuntu
COPY ./kasmvnc.yaml /etc/kasmvnc/kasmvnc.yaml

WORKDIR /data
COPY ./scripts ./scripts
COPY ./temp ./temp
RUN chmod +x /data/scripts/*
RUN dpkg -i ./temp/chrome.deb

ENTRYPOINT ["/data/scripts/startup.sh"]