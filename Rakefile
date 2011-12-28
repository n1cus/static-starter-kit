desc "cleanup from upstream dependencies (such as the parent repo)"
task :bootstrap do
  current_directory = Dir.pwd
  project_name = File.basename(Dir.pwd)
  
  remote_user = ask("Remote User", default: "deploy")
  remote_host = ask("Remote Host", default: "71.19.150.123")
  remote_path = ask("Remote Path", default: "/home/deploy/repositories")
  remote_name = ask("Remote NAME", default: project_name)
    
  remote_url = "#{remote_user}@#{remote_host}:#{remote_path}/#{remote_name}.git"
  STDOUT.puts "Gonna create repository on: #{remote_url}"  
  
  command = []
  command << "cd '#{current_directory}'"
  command << "rm -fR .git"
  command << "git init"
  command << "git add ."
  command << "git commit -am 'Initial Import'"
  command << "cd .."
  command << "git clone --bare #{project_name} #{remote_name}.git"
  command << "scp -r #{remote_name}.git #{remote_url}"
  command << "rm -fR #{project_name} #{remote_name}.git"
  command << "git clone #{remote_url} #{project_name}"
  command << "cd '#{project_name}'"
  command << "git push"
  
  final_command = command.join(" && ")
  STDOUT.puts "Executing #{final_command}"
  system final_command
  STDOUT.puts "-----------------------------------------"
  STDOUT.puts "Your new repository is: #{remote_url}"
end


def ask(question, options = {})
  question = if options[:default]
    "#{question} (#{options[:default]}):"  
  else
    "#{question}:"
  end
  
  STDOUT.print question
  STDOUT.flush
  answer = STDIN.gets.gsub("\n", "")
  answer = options[:default] if answer.empty?
  answer
end
