
user "codedash" do
  supports :manage_home => true
  comment "Code Dash User"  
  gid "root"
  home "/home/codedash"
  shell "/bin/bash"
  password "codedash2014"
  action :create 
end