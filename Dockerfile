# Shift Left Security is a mandatory capability for every organizations!

FROM redis:latest

RUN adduser demo --disabled-password

# Uncomment the below line to set the a specific user for the container execution instead of running with user root
# USER demo

CMD ["sh"]
