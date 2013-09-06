# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "wheezy64"
  config.berkshelf.enabled = true

  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = false
    #   # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end
  
  config.vm.hostname = "java-machine"

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :java => {
        :jdk_version => '7',
        :oab_java_url => "https://raw.github.com/jsirex/oab-java6/master/oab-java.sh", #contains latest fix, TODO remove
      }
    }
    chef.run_list = [
        "recipe[java]"
    ]
  end

end
