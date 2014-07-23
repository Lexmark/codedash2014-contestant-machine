
user "codedash" do  
  comment "codedash"  
  gid "users"
  home "/home/codedash"
  shell "/bin/bash"
  password "$1$22bgA1YD$JgBUYEoCwqv0lzYowJAtt/"
  action :create 
end

bash "change ownership of the " do  
  code <<-EOF
    chown -R codedash /home/codedash
  EOF
end