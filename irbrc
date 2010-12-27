require 'pp'

require 'rubygems'
require 'hirb'
require 'wirble'

Wirble.init
Wirble.colorize
Hirb::View.enable

if rails_env = ENV['RAILS_ENV']
  rails_root = File.basename(Dir.pwd)
  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:RAILS] = {
    :PROMPT_I => "#{rails_root}> ",
    :PROMPT_S => "#{rails_root}* ",
    :PROMPT_C => "#{rails_root}? ",
    :RETURN => "=> %s\n" 
  }
  IRB.conf[:PROMPT_MODE] = :RAILS 
  IRB.conf[:IRB_RC] = Proc.new do
    begin
      ActiveRecord::Base.logger = Logger.new(STDOUT)
    rescue
      puts "No ActiveRecord for this project."
    end
  end
end
