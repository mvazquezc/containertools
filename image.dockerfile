FROM fedora:33
RUN dnf install -y bind-utils tcpdump nmap-ncat iputils && dnf clean all
CMD ["nc", "-l", "9999"]