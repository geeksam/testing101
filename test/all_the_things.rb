#!/usr/bin/env ruby

require 'pathname'
here = Pathname.new(File.expand_path(File.dirname(__FILE__)))
Dir.glob(here + '[0-9]*.rb').each do |testfile|
  puts '', File.basename(testfile)
  require here + testfile
end
