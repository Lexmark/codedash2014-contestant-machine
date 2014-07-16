bash "add mono develop apt repository" do  
  code <<-EOF    
    sudo add-apt-repository ppa:keks9n/monodevelop-latest -y
    sudo apt-get update
  EOF
end

#Install monodevelop
package "monodevelop-latest" do
  action :install
end