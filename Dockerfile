FROM centos:8

EXPOSE 34197
USER root
WORKDIR /opt/factorio

RUN useradd -U -m factorio
RUN chown -R factorio:factorio /opt/factorio

RUN dnf install -y unzip crontabs

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

COPY --chown=factorio:factorio bin bin
COPY --chown=factorio:factorio data data
COPY --chown=factorio:factorio mods mods
COPY --chown=factorio:factorio scripts scripts
COPY --chown=factorio:factorio config-path.cfg .

RUN crontab -u factorio /opt/factorio/scripts/factorio-sync

CMD ./scripts/start.sh
