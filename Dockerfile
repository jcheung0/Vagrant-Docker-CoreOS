FROM phusion/baseimage
#RUN apt-get update & apt-get upgrade
RUN rm -f /etc/service/sshd/down
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
#RUN /usr/sbin/enable_insecure_key
CMD [ "/sbin/my_init","--enable-insecure-key"]
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN apt-get install -y openssh-server 
#apache2
#RUN echo 'root:screencast' | chpasswd
#RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
#RUN mkdir /var/run/sshd
#RUN chmod 0755 /var/run/sshd
# SSH login fix. Otherwise user is kicked off after login
#RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

#create and configure vagrant user
#RUN useradd --create-home -s /bin/bash vagrant
#WORKDIR /home/vagrant

# Configure SSH access
#RUN mkdir -p /home/vagrant/.ssh
#RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" > /home/vagrant/.ssh/authorized_keys
#RUN chown -R vagrant: /home/vagrant/.ssh
#RUN echo -n 'vagrant:vagrant' | chpasswd

# Enable passwordless sudo for the "vagrant" user
#RUN echo 'vagrant ALL=NOPASSWD: ALL' > /etc/sudoers.d/vagrant

#EXPOSE 22 80

#CMD ["/usr/sbin/sshd", "-D"] 


