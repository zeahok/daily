#!/usr/bin/ruby
require 'webrick'

#check os
unless ENV["OS"] && ENV["OS"].downcase.include?("windows")
  #if not windows, check privilege
  if Process.euid != 0
    puts "Are you root? you need to be root to run this script."
    exit 1
  end
end

#start http server based on current directory
s = WEBrick::HTTPServer.new(
  :DocumentRoot => Dir::pwd
)
trap("INT") { s.shutdown }
s.start

