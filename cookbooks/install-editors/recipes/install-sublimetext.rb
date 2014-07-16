

bash "add sublime test apt repository" do  
  code <<-EOF    
    sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
    sudo apt-get update
  EOF
end

#Install emacs
package "sublime-text-installer" do
  action :install
end