# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "wp"
  config.vm.network "private_network", ip: "192.168.56.56"

  # config.vm.synced_folder "./www/web-repo", "/var/www", :nfs => { :mount_options => ["dmode=777", "fmode=666"] }

  # If you have trouble with NFS above, comment it out and use the following instead
  config.vm.synced_folder "./www", "/var/www/app/public", :mount_options => ["dmode=777", "fmode=666"]
  config.vm.synced_folder "./www", "/var/www/app/public", :owner=> 'www-data', :group=>'root'

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end

  config.ssh.insert_key = false

  config.vm.provision :shell, keep_color: true, path: "scripts/provision.sh"

end