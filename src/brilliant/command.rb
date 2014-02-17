require "brilliant"
require "brilliant/compiler"


module Brilliant
  class Command
    def initialize
      file = ARGV.first
      abort "Usage: brilliant file.bril" unless file
      @source_code = File.read(file)
    end

    def run
      exit_code = Brilliant::Compiler.new(@source_code).run
      exit(exit_code)
    end
  end
end
