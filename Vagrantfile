ENV[ 'VAGRANT_DEFAULT_PROVIDER'] = 'docker'
DOCKER_HOST_NAME = "core-01"
Vagrant.require_version ">=1.6.0"

Vagrant.configure(2) do |config|
  

  config.vm.define "app" do |app|
      app.vm.provider "docker" do |d|
        d.build_dir = "." 
        #d.image = "phusion/baseimage"
        d.vagrant_vagrantfile = "coreos-vagrant/Vagrantfile"
        d.remains_running = false
        d.name = "jcdev-core"
        d.vagrant_machine = DOCKER_HOST_NAME
        d.expose = [22,80,8080,8081]
        d.ports = ["2222:22","9090:80","9091:8080","9092:8081"]
        d.volumes = ["/home/core/share:/home/share"]
        
        #d.cmd = ["sudo apt-get install openssh-server -y"]
        #d.run = 'ubuntu'
        d.has_ssh=true
      end
      #config.vm.synced_folder "/Users/jcheung/Dev", "/home/shared"
      #config.vm.boot_timeout = 
      #config.ssh.port = 22
      app.ssh.username = "root"
      app.ssh.private_key_path = "phusion.key"
      app.ssh.forward_agent = true
      #config.ssh.proxy_command = 'ssh core@127.0.0.1  -p 2222 -i /Users/jcheung/.vagrant.d/insecure_private_key -o Compression=yes -o ConnectTimeout=5 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no exec nc %h %p 2>/dev/null -o UserKnownHostsFile=/dev/null -o ControlMaster=auto -o ControlPersist=60s -o ControlPath="/Users/jcheung/.ansible/cp/ansible-ssh-%h-%p-%r" -o StrictHostKeyChecking=no -o Port=22 -o IdentityFile="/Users/jcheung/Dev/VMS/vm-build/phusion.key"ssh -C -tt -vvv -o ProxyCommand=ssh  -p 2222 -i /Users/jcheung/.vagrant.d/insecure_private_key -o Compression=yes -o ConnectTimeout=5 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no exec nc %h %p 2>/dev/null -o UserKnownHostsFile=/dev/null -o ControlMaster=auto -o ControlPersist=60s -o ControlPath="/Users/jcheung/.ansible/cp/ansible-ssh-%h-%p-%r" -o StrictHostKeyChecking=no -o Port=22 -o IdentityFile="/Users/jcheung/Dev/VMS{,hare}iSuuu/vm-build/phusion.key"}'
     # config.vm.provision "docker" do |d|
      #  d.build_image "/vagrant",args: "-t jcdevbot/myimage"
         
     # end
      app.vm.provision "ansible" do |ansible|
        ansible.playbook = "ansible/playbooks/playbook.yml" 
        #ansible.inventory_path = "ansible/inventory/app.inventory"
        ansible.verbose = 'vvvv'
        ansible.host_key_checking = false
        #ansible.raw_ssh_args = ["core@127.0.0.1", "-p", "2222", "-o", "Compression=yes", "-o", "DSAAuthentication=yes", "-o", "LogLevel=FATAL", "-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "-o", "IdentitiesOnly=yes", "-i", "/Users/jcheung/.vagrant.d/insecure_private_key", "-t", "ssh root@10.1.0.14 -p22 -i /tmp/key_84e1e6b6e7d6a476dc0497a19fbf82e2_ce9f5855bbb3760dd2e5dbd9267bf107 -o Compression=yes -o ConnectTimeout=5 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"]

        #ansible.extra_vars = {remote_user:'core'}
        #proxy_cmd = 'ssh core@localhost -o StrictHostKeyChecking=no -t -A -p 2222 -i ~/Dev/VMS/vm-build/phusion.key exec nc %h %p 2>/dev/null'
        #ansible.raw_ssh_args = ["-o ProxyCommand='#{ proxy_cmd }'"]
        #ansible.raw_ssh_args = ["core@localhost"]
      end
  end
  
end
