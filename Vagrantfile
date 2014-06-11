VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise64"
  config.vm.network "private_network", ip: "192.168.55.44"

  config.vm.synced_folder "./.phucket", "/vagrant/.phucket"
  config.vm.synced_folder "./", "/var/www", type: 'nfs'
  config.vm.network "forwarded_port", guest: 5858, host: 5858

  config.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "4096", '--cpus', '3']
  end

  config.vm.provision :shell, :path => ".phucket/phucket/phucket.sh"

end