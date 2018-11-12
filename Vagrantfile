# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "db01" do |subconfig|
    subconfig.vm.box = "chavo1/trusty64"
    subconfig.vm.network "private_network", ip: "192.168.56.55"
    subconfig.vm.provision :shell, keep_color: true, path: "scripts/mysql.sh"
  end

  config.vm.define "web01" do |subconfig|
    subconfig.vm.box = "chavo1/trusty64"
    subconfig.vm.network "private_network", ip: "192.168.56.56"
    subconfig.vm.synced_folder "./www", "/var/www/app/public", :mount_options => ["dmode=777", "fmode=666"]
    subconfig.vm.synced_folder "./www", "/var/www/app/public", :owner=> 'www-data', :group=>'root'
    subconfig.vm.provision :shell, keep_color: true, path: "scripts/provision.sh"
  end
end

