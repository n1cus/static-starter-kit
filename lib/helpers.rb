module Incredible

  module Helpers

    def audio_web_paths
      audio_files_by_type.map do |audio_path|
        audio_path = Pathname.new(audio_path)
        audio_path.relative_path_from(Pathname.new(public_path)).to_s
      end
    end

    def audio_files_by_type(type = 'ogg') 
      Dir[audios_path_for(type)]
    end

    def audios_path_for(type)
      File.join(audios_path, "*.#{type}")
    end

    def root_path
      File.join(File.dirname(__FILE__), "../")
    end
    
    def public_path
      File.join(root_path, "public")
    end

    def audios_path
      File.join(public_path, "audios")
    end
  end
end

require 'haml'
module Haml
  module Helpers
    include Incredible::Helpers
  end
end
