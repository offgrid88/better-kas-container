FROM crops/yocto:ubuntu-20.04-base
# TODO get current user UID and GID 
ARG USER=bks_user
ARG UID=1001
ARG GID=1001
USER root
# create a new user with same UID & PID but no password
RUN groupadd --gid ${GID} ${USER} && \
    useradd --create-home ${USER} --uid=${UID} --gid=${GID} --groups root && \
    passwd --delete ${USER}
# add user to the sudo group and set sudo group to no passoword
RUN apt update && \
    apt install -y sudo && \
    adduser ${USER} sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# prevent tzdata to ask for configuration
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt -y install tzdata
RUN apt install -y build-essential git cmake

# setup default user when enter the container
USER ${UID}:${GID}
WORKDIR /home/${USER}


USER root
RUN apt -y update &&       \
    apt -y upgrade      
 

USER yoctouser
WORKDIR /home/yoctouser

