Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/jammy64"
    config.vm.hostname = "kubevote"
  
    # Add a bridged interface 
    config.vm.network "public_network"
  
    config.vm.provider "virtualbox" do |vb|
      vb.name = "kubevote-vm"
      vb.memory = 4096
      vb.cpus = 2
    end

    # Run your shell script during provisioning
    config.vm.provision "shell", path: "scripts/install-docker.sh"
    config.vm.provision "shell", path: "scripts/install-kubectl.sh"
    config.vm.provision "shell", path: "scripts/install-minikube.sh"
    config.vm.provision "shell", path: "scripts/setup-verify.sh"
end