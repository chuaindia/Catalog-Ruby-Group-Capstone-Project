require_relative 'app'

def entry_point
  puts "Welcome\n"
  app = App.new
  app.choose_options
end

entry_point
