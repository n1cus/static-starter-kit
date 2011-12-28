module StarterKit
  module Helpers

  end
end

require 'haml'
module Haml
  module Helpers
    include StarterKit::Helpers
  end
end
