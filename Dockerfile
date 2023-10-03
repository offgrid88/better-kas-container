FROM crops/yocto:ubuntu-20.04-base
# TODO get current user UID and GID 
ARG USER
ARG UID
ARG GID
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



USER root
RUN apt -y update &&       \
    apt -y upgrade      

RUN apt install -y                                             \
    gawk wget git diffstat                                      \
    unzip texinfo gcc build-essential                            \
    chrpath socat cpio python3 python3-pip                        \
    python3-pexpect xz-utils debianutils iputils-ping              \
    python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev           \
    pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool   


# setup default user when enter the container
USER ${UID}:${GID}
WORKDIR /home/${USER}

RUN cd /home/${USER}                               &&           \
    rm -rf ./kas                                   &&            \
    git clone https://github.com/siemens/kas.git   &&             \
    cd ./kas                                        

USER root

RUN cd /home/${USER}/kas && \
    pip3 install .