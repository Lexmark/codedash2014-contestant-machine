

base_language_doc_dir = '/home/codedash/Desktop/Language_Docs'


bash "create directory" do  
  code <<-EOF
    mkdir -p #{base_language_doc_dir}
  EOF
end

remote_file "#{Chef::Config[:file_cache_path]}/jdk-8u11-apidocs.zip" do
  source "http://download.oracle.com/otn-pub/java/jdk/8u11-b12/jdk-8u11-apidocs.zip"

  action :create_if_missing
end

bash "unzip java docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		unzip jdk-8u11-apidocs.zip
		ls
	EOF
end

bash "move java docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		mv jdk-8u11-apidocs #{base_language_doc_dir}
	EOF
end
