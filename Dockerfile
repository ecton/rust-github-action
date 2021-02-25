FROM khonsulabs/build-rust:latest

USER runner

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY build.sh migrate.sh test.sh doc.sh /

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/build.sh"]