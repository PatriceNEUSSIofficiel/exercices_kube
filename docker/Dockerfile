FROM marwaney/ssh-server
COPY docker.pub /home/sshuser/.ssh/authorized_keys 
CMD [ "/usr/sbin/sshd", "-D" ]
