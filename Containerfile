FROM fedora:39
RUN dnf install -y bind-utils tcpdump nmap-ncat iputils iproute procps-ng stress lsof openssl strace && dnf clean all
RUN setcap 'cap_net_raw+ep' /usr/sbin/tcpdump
RUN curl -L https://github.com/kubernetes-sigs/cri-tools/releases/download/v1.28.0/crictl-v1.28.0-linux-amd64.tar.gz -o crictl.tar.gz && tar xvfz crictl.tar.gz && mv crictl /usr/bin && rm -f crictl.tar.gz 
RUN cd /tmp && curl https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest-4.14/openshift-client-linux.tar.gz -o openshift-client-linux.tar.gz && tar xvfz openshift-client-linux.tar.gz \
&& mv oc kubectl /usr/bin/ && chmod +x /usr/bin/{oc,kubectl} && rm -f README.md openshift-client-linux.tar.gz
USER 9999
CMD ["sleep", "infinity" ]
