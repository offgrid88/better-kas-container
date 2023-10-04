FROM archlinux:latest

RUN echo 'root:rootpassword' | chpasswd && yes | pacman -Syu && echo -e "\ny\n" | pacman -Sy zsh git sudo base-devel vim

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) && echo '/bin/zsh' | chsh root"

RUN groupadd -g 1000 ci-user
RUN useradd -d /home/ci-user -m ci-user -u 1000 -g 1000
RUN echo "ci-user:ci-user" | chpasswd
RUN usermod -a -G wheel ci-user
RUN echo "%wheel        ALL=(ALL)       ALL" >> /etc/sudoers

USER ci-user
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) && echo -e 'userpassword\n/bin/zsh\n' | chsh ci-user"

ENTRYPOINT ["tail", "-f", "/dev/null"]