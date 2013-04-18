desc "cleanup from upstream dependencies (such as the parent repo)"
task :bootstrap do
  current_directory = Dir.pwd
  project_name = File.basename(Dir.pwd)
  
  command = []
  command << "cd '#{current_directory}'"
  command << "rm -fR .git"
  command << "git init"
  command << "git add ."
  command << "git commit -am 'Initial Import'"
  
  final_command = command.join(" && ")
  STDOUT.puts "Executing #{final_command}"
  system final_command
  STDOUT.puts "-----------------------------------------"
  STDOUT.puts "Your new repository is: #{remote_url}"
end
