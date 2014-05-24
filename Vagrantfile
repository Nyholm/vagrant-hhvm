# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant::configure("2") do |config|
	config.vm.box = "precise64"
	config.vm.box_url = "http://files.vagrantup.com/precise64.box"
	config.vm.hostname = "hhvm.local"
	config.ssh.forward_agent = true

	config.vm.network :private_network, ip: "192.168.99.99"

	config.vm.provision :shell do |shell|
		shell.inline = "mkdir -p /etc/puppet/modules; puppet module install --force puppetlabs/apt; puppet module install --force puppetlabs-stdlib"
	end

	config.vm.provision :puppet do |puppet|
		puppet.manifests_path = "puppet/manifests"
		puppet.manifest_file  = "base.pp"
		puppet.module_path = "puppet/modules"
	end

    # If you want to run a symfony application uncomment this line and change the path
	#config.vm.synced_folder "/Users/tobias/Workspace/Symfony", "/srv/sf.hhvm/"

end
