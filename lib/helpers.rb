module Incredible

  module Helpers

    def audio_web_paths(&block)
      audio_names = audio_files.map do |file|
        audio_file = Pathname.new(file)
        audio_extension = audio_file.extname
        audio_name = audio_file.basename(audio_extension)
      end.uniq

      audio_names.each do |audio_name|
        audio_sources = audio_files(audio_name).map do |file|
          Pathname.new(file).relative_path_from(Pathname.new(public_path)).to_s
        end
        yield(audio_name, audio_sources)
      end
    end

    def audio_types
      %w(ogg mp3)
    end

    def audio_files(prefix = "")
      Dir[File.join(audios_path, "#{prefix}*")]
    end

    def root_path
      File.expand_path(File.join(File.dirname(__FILE__), "../"))
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
