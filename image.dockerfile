FROM fedora:33
RUN dnf install -y bind-utils tcpdump nmap-ncat iputils iproute procps-ng stress && dnf clean all
RUN setcap 'cap_net_raw+ep' /usr/sbin/tcpdump
USER 9999
CMD ["sleep", "infinity" ]
