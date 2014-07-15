


#Install Eclipse 4.4 for Java
eclipse_java_dir = '/opt/eclipse/java'
eclipse_java_dir_install_path = "#{eclipse_java_dir}/eclipse"

remote_file "#{Chef::Config[:file_cache_path]}/eclipse-standard-luna-R-linux-gtk-x86_64.tar.gz" do
  source "http://mirror.cc.columbia.edu/pub/software/eclipse/technology/epp/downloads/release/luna/R/eclipse-standard-luna-R-linux-gtk-x86_64.tar.gz"

  action :create_if_missing
end

bash "untar eclipse" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
  	mkdir -p #{eclipse_java_dir}
    tar xvf eclipse-standard-luna-R-linux-gtk-x86_64.tar.gz  -C #{eclipse_java_dir}
  EOF
  not_if { ::File.exists?(eclipse_java_dir_install_path) }
end

template 'eclipse.desktop' do  
  path "#{eclipse_java_dir_install_path}/eclipse.desktop"  
  source   'java-eclipse.desktop'
end

bash "install eclipse.desktop" do
  cwd eclipse_java_dir_install_path
  code <<-EOF
  	desktop-file-install eclipse.desktop 
  EOF

end

bash "create symlink" do
  cwd eclipse_java_dir_install_path
  code <<-EOF
  	ln -s #{eclipse_java_dir_install_path}/eclipse /usr/local/bin/eclipse-java
  EOF

end

bash "copy icon" do
  cwd eclipse_java_dir_install_path
  code <<-EOF
  	cp #{eclipse_java_dir_install_path}/icon.xpm /usr/share/pixmaps/eclipse-java.xpm
  EOF

end


bash "change permissions" do
cwd "#{eclipse_java_dir_install_path}/configuration"
  code <<-EOF  	
  	chmod 777 -R org.eclipse.osgi  	
  EOF
end




