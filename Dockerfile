FROM crops/yocto:ubuntu-20.04-base

ARG BKC_USER
ARG BKC_UID
ARG BKC_GID

USER root

# create a new user with same UID & PID but no password
RUN groupadd --gid ${BKC_GID} ${BKC_USER} && \
    useradd --create-home ${BKC_USER} --uid=${BKC_UID} --gid=${BKC_GID} --groups root && \
    passwd --delete ${BKC_USER}
# add user to the sudo group and set sudo group to no passoword
RUN apt update && \
    apt install -y sudo && \
    adduser ${BKC_USER} sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# prevent tzdata to ask for configuration
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt -y install tzdata
RUN apt install -y build-essential git cmake



USER root
RUN apt -y update 

# Optional upgrade just for upper version of Yocto 
#RUN apt -y upgrade      

RUN apt install -y                                             \
    gawk wget git diffstat                                      \
    unzip texinfo gcc build-essential                            \
    chrpath socat cpio python3 python3-pip                        \
    python3-pexpect xz-utils debianutils iputils-ping              \
    python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev           \
    pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool   


# setup default user when enter the container
USER ${BKC_UID}:${BKC_GID}
WORKDIR /home/${BKC_USER}

RUN cd /home/${BKC_USER}                               &&           \
    rm -rf ./kas                                   &&            \
    git clone https://github.com/siemens/kas.git   &&             \
    cd ./kas                                        

USER root

RUN cd /home/${BKC_USER}/kas && \
    pip3 install .