Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 8080, host: 8083

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.name = "jenkins-docker"
  end

  config.vm.define "jenkins-docker" do |tendo|
  end

  config.vm.provision "shell", inline: <<-SHELL
    #Jenkins source
    wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
    sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'

    #Docker source
    apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    mkdir -p /etc/apt/sources.list.d
    echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list

    sudo apt-get update
    sudo apt-get install -y jenkins docker-engine

  SHELL


end
