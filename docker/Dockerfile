FROM marwaney/ssh-server
COPY docker.pub /home/sshuser/.ssh/authorized_keys
EXPOSE 8000 
CMD [ "/usr/sbin/sshd", "-D" ]
