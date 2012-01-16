require './lib/helpers'

# SASS
guard 'sass', :input => 'source/sass', :output => 'public/stylesheets'

# CoffeeScript
guard 'coffeescript', :input => 'source/javascripts', :output => 'public/javascripts', :bare => true

# HAML
guard 'haml', :input => 'source', :output => 'public' do
  watch(/^.+(\.html\.haml)/)
end

