bash "add mono develop apt repository" do  
  code <<-EOF    
    sudo add-apt-repository ppa:ermshiperete/monodevelop -y
    sudo apt-get update
  EOF
end

#Install monodevelop
package "monodevelop-current" do
  action :install
end