from fedora:latest
RUN dnf -y update
RUN dnf install @cinnamon-desktop-environment
RUN dnf install -y tigervnc-server
RUN dnf install -y novnc python-websockify openssl
RUN mkdir /root/.vnc
RUN chown -R root:root /root/.vnc
RUN touch /root/.vnc/passwd
RUN chmod 0600 /root/.vnc/passwd
COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh
ENV SHELL=/bin/bash
ENV TZ=Asia/Dhaka
ENTRYPOINT /root/start.sh
