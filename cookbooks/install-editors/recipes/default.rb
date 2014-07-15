#
# Cookbook Name:: setup-machine
# Recipe:: default
#
# Copyright 2014, Perceptive Software
#


include_recipe 'apt'

#Install C++
package "g++" do
  action :install
end

#Install C
package "gcc" do
  action :install
end

#Install C# Mono
package "mono-complete" do
  action :install
end

#Install Ruby Prerequisites
package "git-core" do
  action :install
end

package "curl" do
  action :install
end

package "zlib1g-dev" do
  action :install
end

package "build-essential" do
  action :install
end

package "libssl-dev" do
  action :install
end

package "libreadline-dev" do
  action :install
end

package "libyaml-dev" do
  action :install
end

package "libxml2-dev" do
  action :install
end

package "libxslt1-dev" do
  action :install
end

#Install Ruby
package "ruby" do
  action :install
end

#Install Java
package "python-software-properties" do
  action :install
end

bash "add java apt repository" do  
  code <<-EOF    
    sudo add-apt-repository ppa:webupd8team/java -y
    sudo apt-get update
  EOF
end

bash "accept license java prerequisites" do  
  code <<-EOF
    sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections    
  EOF
end

package "oracle-java8-installer" do
  action :install
end

bash "update-alternatives java" do  
  code <<-EOF
    sudo update-alternatives --display java
  EOF
end

#Install Clojure
package "leiningen" do
  action :install
end

#Install scala
package "scala" do
  action :install
end

#Install groovy
package "groovy" do
  action :install
end

#Install python
package "python" do
  action :install
end
