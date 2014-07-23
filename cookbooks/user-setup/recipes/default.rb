
user "codedash" do
  supports :manage_home => true
  comment "Code Dash User"  
  gid "root"
  home "/home/codedash"
  shell "/bin/bash"
  password "$1$22bgA1YD$JgBUYEoCwqv0lzYowJAtt/"
  action :create 
end