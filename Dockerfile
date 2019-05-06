FROM node:8-alpine

WORKDIR /home/node/app
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.5.0/wait /wait
RUN chmod +x /wait

ARG FHIR_SERVER_LOCATION
ENV fhirServerLocation=$FHIR_SERVER_LOCATION

COPY . .

RUN chown -R node:node /home/node/app

USER node

RUN ["npm", "install"]

CMD /wait && node server --server $fhirServerLocation
