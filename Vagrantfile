Vagrant.configure("2") do |config|

  config.vm.provision "shell", path: "install-docker.sh"
  config.vm.provision "shell", path: "install-kubernetes.sh"
  config.vm.provision "shell", path: "custom-linux.sh"

  
  config.vm.define "kubemaster" do |kubemaster|
    kubemaster.vm.box = "centos/8"
    kubemaster.vm.hostname = "master.glag.local"
    kubemaster.vm.network "private_network", ip: "172.15.20.10"
    kubemaster.vm.provider "virtualbox" do |v|
      v.name = "kubemaster1"
      v.cpus = 2
      v.memory = 2048
    end
    kubemaster.vm.provision "shell", path: "install-nfs-server.sh"
    kubemaster.vm.provision "shell", path: "kube-init.sh"
  end
  
  workers_number = 3

  # déploiment des workers
  (1..workers_number).each do |i|
    config.vm.define "kubeworker#{i}" do |kubeworker| 
      kubeworker.vm.box = "centos/8"
      kubeworker.vm.hostname = "worker#{i}.glag.local"
      kubeworker.vm.network "private_network", ip: "172.15.20.10#{i}"
      kubeworker.vm.provider "virtualbox" do |v|
        v.name = "kubeworker#{i}"
        v.cpus = 1
        v.memory = 1024
      end
      kubeworker.vm.provision "shell", path: "install-nfs-client.sh"
      kubeworker.vm.provision "shell", path: "kube-join.sh"
    end
  end

end
