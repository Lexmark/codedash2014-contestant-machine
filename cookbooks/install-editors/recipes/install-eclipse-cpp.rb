


#Install Eclipse 4.4 for Java
eclipse_cpp_dir = '/opt/eclipse/cpp'
eclipse_cpp_dir_install_path = "#{eclipse_cpp_dir}/eclipse"

remote_file "#{Chef::Config[:file_cache_path]}/eclipse-cpp-luna-R-linux-gtk-x86_64.tar.gz" do
  source "http://ftp.ussg.iu.edu/eclipse/technology/epp/downloads/release/luna/R/eclipse-cpp-luna-R-linux-gtk-x86_64.tar.gz"

  action :create_if_missing
end

bash "untar eclipse" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
  	mkdir -p #{eclipse_cpp_dir}
    tar xvf eclipse-cpp-luna-R-linux-gtk-x86_64.tar.gz  -C #{eclipse_cpp_dir}
  EOF
  not_if { ::File.exists?(eclipse_cpp_dir_install_path) }
end

template 'eclipse.desktop' do  
  path "#{eclipse_cpp_dir_install_path}/cpp-eclipse.desktop"  
  source   'cpp-eclipse.desktop'
end

bash "install eclipse.desktop" do
  cwd eclipse_cpp_dir_install_path
  code <<-EOF
  	desktop-file-install cpp-eclipse.desktop 
  EOF

end

bash "create symlink" do
  cwd eclipse_cpp_dir_install_path
  code <<-EOF
  	ln -s #{eclipse_cpp_dir_install_path}/eclipse /usr/local/bin/eclipse-cpp
  EOF
  not_if { ::File.exists?('/usr/local/bin/eclipse-cpp') }
end

bash "copy icon" do
  cwd eclipse_cpp_dir_install_path
  code <<-EOF
  	cp #{eclipse_cpp_dir_install_path}/icon.xpm /usr/share/pixmaps/eclipse-cpp.xpm
  EOF

end