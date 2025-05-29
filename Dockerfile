FROM alpine:latest

ARG USERNAME=paperles
ARG USER_GROUP=paperles
ARG USER_UID=1041
ARG USER_GID=65539

# Install dependencies
USER root

RUN apk update && apk add inotify-tools shadow

# Create a new user and group
RUN echo "Creating usergroup $USER_GROUP with GID $USER_GID and user $USERNAME with UID $USER_UID" 
RUN groupadd -f --gid $USER_GID $USER_GROUP\
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

# Copy the scripts
COPY ./shellscripts /shellscripts

# Chown all the files to the app user.
RUN chmod +x /shellscripts/copy-files.sh \
    && chown -R $USER_UID:$USER_GID /shellscripts

# Switch to 'appuser'
USER $USERNAME

WORKDIR /shellscripts

ENTRYPOINT [ "/bin/sh", "/shellscripts/copy-files.sh" ]
