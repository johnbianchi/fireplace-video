FROM petrosagg/resin-wpe:raspberrypi3-30c7465

COPY wpe-init /wpe-init

RUN chmod +x wpe-init

CMD [ "/wpe-init" ]
