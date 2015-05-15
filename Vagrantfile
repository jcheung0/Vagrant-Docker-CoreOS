ENV[ 'VAGRANT_DEFAULT_PROVIDER'] = 'docker'
DOCKER_HOST_NAME = "core-01"

Vagrant.configure(2) do |config|
  config.vm.provider "docker" do |d|
    #d.build_dir = "." 
    d.image = "ubuntu"
    d.vagrant_vagrantfile = "coreos-vagrant/Vagrantfile"
    d.remains_running = false
    d.name = "jcdev-core"
    d.vagrant_machine = DOCKER_HOST_NAME
    d.expose = [22,80,8080,8081]
    d.ports = ["2222:22","9090:80","9091:8080","9092:8081"]
    d.volumes = ["/home/core/share:/home/share"]
    #d.cmd = ["sudo apt-get install openssh-server -y"]
    #d.has_ssh=true
  end
  #config.vm.synced_folder "/Users/jcheung/Dev", "/home/shared"
  config.ssh.port = 22
  config.vm.provision "docker" do |d|
    d.build_image "/vagrant",args: "-t jcdevbot/myimage"
     
  end
  #config.vm.provision "ansible" do |ansible|
  #  ansible.playbook = "ansible/playbooks/playbook.yml" 
  #end
end
