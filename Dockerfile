FROM centos:8

EXPOSE 34197
USER root
WORKDIR /opt/factorio

RUN dnf install -y unzip crontabs

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

RUN useradd -U -m factorio
RUN touch /opt/factorio/factorio-sync.log
RUN chown -R factorio:factorio /opt/factorio

COPY --chown=factorio:factorio bin bin
COPY --chown=factorio:factorio data data
COPY --chown=factorio:factorio mods mods
COPY --chown=factorio:factorio scripts scripts
COPY --chown=factorio:factorio config-path.cfg .

RUN crontab -u factorio /opt/factorio/scripts/factorio-sync

CMD ./scripts/start.sh
