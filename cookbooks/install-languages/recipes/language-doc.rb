

base_language_doc_dir = '/home/codedash/Desktop/Language_Docs'


bash "create directory" do  
  code <<-EOF
  	rm -rf #{base_language_doc_dir}
    mkdir -p #{base_language_doc_dir}
    chmod 777 #{base_language_doc_dir}
  EOF
end

#Get Java Docs
remote_file "#{Chef::Config[:file_cache_path]}/jdk-8u11-apidocs.zip" do
  source "http://download.oracle.com/otn-pub/java/jdk/8u11-b12/jdk-8u11-apidocs.zip"

  action :create_if_missing
end

bash "unzip java docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		unzip -o jdk-8u11-apidocs.zip		
	EOF
end

bash "move java docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		rm -rf #{base_language_doc_dir}/jdk-8u11-apidocs/
		mv -f docs #{base_language_doc_dir}/jdk-8u11-apidocs
	EOF
end

# Get Scala Docs http://www.scala-lang.org/files/archive/scala-docs-2.9.2.zip
remote_file "#{Chef::Config[:file_cache_path]}/scala-docs-2.9.2.zip" do
  source "http://www.scala-lang.org/files/archive/scala-docs-2.9.2.zip"

  action :create_if_missing
end

bash "unzip scala docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		unzip -o scala-docs-2.9.2.zip		
	EOF
end

bash "move scala docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		rm -rf #{base_language_doc_dir}/scala-docs-2.9.2/
		mv -f scala-docs-2.9.2 #{base_language_doc_dir}/scala-docs-2.9.2
	EOF
end

#Get ths c++ docs
remote_file "#{Chef::Config[:file_cache_path]}/libstdc++-api-html.tar.gz" do
  source "https://gcc.gnu.org/onlinedocs/gcc-4.8.3/libstdc++-api-html.tar.gz"

  action :create_if_missing
end

bash "unzip c++ docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		tar -xvf libstdc++-api-html.tar.gz		
	EOF
end

bash "move c++ docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		rm -rf #{base_language_doc_dir}/libstdc++-api-html/
		mv -f libstdc++-api-html #{base_language_doc_dir}/libstdc++-api-html
	EOF
end

#Get ths c docs
remote_file "#{Chef::Config[:file_cache_path]}/gnu-c-manual.pdf" do
  source "http://www.gnu.org/software/gnu-c-manual/gnu-c-manual.pdf"

  action :create_if_missing
end

bash "move c docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		mv -f gnu-c-manual.pdf #{base_language_doc_dir}/gnu-c-manual.pdf
	EOF
end

#Get the monodocs
template 'monodoc.sh' do  
  path "#{base_language_doc_dir}/monodoc.sh"  
  source   'monodoc.sh'
end

bash "make monodoc executable" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		chmod +x #{base_language_doc_dir}/monodoc.sh
	EOF
end

#Get the ruby docs
remote_file "#{Chef::Config[:file_cache_path]}/ruby_1_9_3_stdlib_rdocs.tgz" do
  source "http://ruby-doc.org/downloads/ruby_1_9_3_stdlib_rdocs.tgz"

  action :create_if_missing
end

bash "unzip ruby docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		tar -xvf ruby_1_9_3_stdlib_rdocs.tgz		
	EOF
end

bash "move ruby docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		rm -rf #{base_language_doc_dir}/ruby_1_9_3_core/
		mv -f ruby_1_9_3_stdlib #{base_language_doc_dir}/ruby_1_9_3_stdlib
	EOF
end

#Clojure https://github.com/clojure/clojure/archive/gh-pages.zip
remote_file "#{Chef::Config[:file_cache_path]}/gh-pages.zip" do
  source "https://github.com/clojure/clojure/archive/gh-pages.zip"

  action :create_if_missing
end

bash "unzip clojure docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		unzip -o gh-pages.zip	
	EOF
end

bash "move clojure docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		rm -rf #{base_language_doc_dir}/clojure-docs/
		mv -f clojure-gh-pages #{base_language_doc_dir}/clojure-docs
	EOF
end

#groovy http://dist.groovy.codehaus.org/distributions/groovy-docs-1.8.9.zip
remote_file "#{Chef::Config[:file_cache_path]}/groovy-docs-1.8.9.zip" do
  source "http://dist.groovy.codehaus.org/distributions/groovy-docs-1.8.9.zip"

  action :create_if_missing
end

bash "unzip groovy docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		unzip -o groovy-docs-1.8.9.zip	
	EOF
end

bash "move groovy docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		rm -rf #{base_language_doc_dir}/groovy-docs-1.8.9/
		mv -f groovy-1.8.9 #{base_language_doc_dir}/groovy-docs-1.8.9
	EOF
end

#python https://docs.python.org/2.7/archives/python-2.7.8-docs-html.tar.bz2
remote_file "#{Chef::Config[:file_cache_path]}/python-2.7.8-docs-html.tar.bz2" do
  source "https://docs.python.org/2.7/archives/python-2.7.8-docs-html.tar.bz2"

  action :create_if_missing
end

bash "untar python docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		tar -xvf python-2.7.8-docs-html.tar.bz2	
	EOF
end

bash "move python docs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOF
		rm -rf #{base_language_doc_dir}/python-2.7.8-docs-html/
		mv -f python-2.7.8-docs-html #{base_language_doc_dir}/python-2.7.8-docs-html
	EOF
end