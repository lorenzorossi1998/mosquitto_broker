# https://hub.docker.com/_/eclipse-mosquitto

FROM eclipse-mosquitto:2.0.15-openssl

EXPOSE 1883
EXPOSE 8883
EXPOSE 9001

WORKDIR /src

COPY mosquitto.conf .
COPY passwd .
COPY entrypoint.sh .
COPY ca.crt .
COPY broker.crt .
COPY broker.key .

USER 1000

ENTRYPOINT ["sh", "/src/entrypoint.sh"]
CMD ["/usr/sbin/mosquitto","-c","/mosquitto/config/mosquitto.conf"]

# PERSITENCE
# /mosquitto/config
# /mosquitto/data
# /mosquitto/log
