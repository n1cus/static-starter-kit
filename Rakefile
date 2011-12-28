desc "cleanup from upstream dependencies (such as the parent repo)"
task :bootstrap do
  current_directory = Dir.pwd
  project_name = File.basename(Dir.pwd)

  STDOUT.puts "Remote User: "
  remote_user = STDIN.gets
  
  STDOUT.puts "Remote Host: "
  remote_host = STDIN.gets
  
  STDOUT.puts "Remote PATH: "
  remote_path = STDIN.gets
  
  remote_url = "#{remote_user}@#{remote_host}:#{remote_path}"
  STDOUT.puts "Gonna create repository on: #{remote_url}"  
  
  command = []
  command << "cd #{current_directory}"
  command << "cd .."
  command << "git clone --bare #{project_name} #{project_name}.git"
  command << "scp -r #{project_name}.git #{remote_url}"
  command << "rm -fR #{project_name} #{project_name}.git"
  command << "git clone #{remote_url} #{project_name}"
  command << "cd #{project_name}"

  final_command = command.join(" && ")
  STDOUT.puts "Executing #{final_command}"
  system final_command
  STDOUT.puts "done!"  
end