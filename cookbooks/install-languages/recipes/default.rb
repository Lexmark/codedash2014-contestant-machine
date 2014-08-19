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
bash "install java prerequisites" do  
  code <<-EOF
    sudo apt-get -y install python-software-properties
    sudo add-apt-repository ppa:webupd8team/java -y
    sudo apt-get update
  EOF
end

bash "accept license java prerequisites" do  
  code <<-EOF
    sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections    
  EOF
end

bash "install java" do  
  code <<-EOF
    sudo apt-get update && sudo apt-get install oracle-java8-installer -y    
  EOF
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
scala_deb="scala-2.11.2.deb"
remote_file "#{Chef::Config[:file_cache_path]}/#{scala_deb}" do
  source "http://www.scala-lang.org/files/archive/#{scala_deb}"
  action :create_if_missing
end

bash "remove scala" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
    apt-get remove scala-library scala -y
  EOF
end

bash "unpack scala" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
    dpkg -i #{scala_deb}
    apt-get update
  EOF
end

#Install groovy
package "groovy" do
  action :install
end

#Install python
package "python" do
  action :install
end
