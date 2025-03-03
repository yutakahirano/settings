FROM ubuntu:24.04

ENV LC_ALL C
ENV LANG C

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y aptitude git python3 python3-pip vim lldb clang cmake pipx net-tools openssh-server tmux
RUN apt-get install -y curl wget python3-numpy python3-matplotlib python3-scipy pycodestyle mypy pycodestyle
RUN apt-get install -y parallel diffstat libssl-dev sqlite3 libsqlite3-dev libbz2-dev
RUN apt-get autoremove -y &&\
    apt-get clean &&\
    rm -rf /usr/local/src/*

RUN mkdir -p -m0755 /var/run/sshd

RUN useradd -d /home/yhirano -u 30006 yhirano -s /bin/bash
USER yhirano
WORKDIR /home/yhirano
RUN mkdir -p --mode=700 /home/yhirano/.ssh
RUN mkdir -p /home/yhirano/.config

COPY --chown=yhirano:yhirano .netrc /home/yhirano/.netrc
COPY --chown=yhirano:yhirano .bashrc /home/yhirano/.bashrc
COPY --chown=yhirano:yhirano .bashrc /home/yhirano/.bash_profile
COPY --chown=yhirano:yhirano .inputrc /home/yhirano/.inputrc
COPY --chown=yhirano:yhirano .tmux.conf /home/yhirano/.tmux.conf
COPY --chown=yhirano:yhirano --chmod=700 authorized_keys /home/yhirano/.ssh/authorized_keys
COPY --chown=yhirano:yhirano pycodestyle /home/yhirano/.config/pycodestyle

RUN curl --proto '=https' --tlsv1.3 -sSf https://sh.rustup.rs | sh -s -- -y
RUN ~/.cargo/bin/rustup default stable
# RUN ~/.cargo/bin/rustup component remove rust-docs

RUN pip3 install --break-system-packages qulacs qiskit qiskit-aer stim pymatching colorcet holoviews

USER root

