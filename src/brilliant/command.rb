require "brilliant"
require "brilliant/compiler"


module Brilliant
  class Command
    def initialize
      process_options
      abort "Usage: brilliant [--run] file.bril" unless file_name
    end

    def run
      if @action == :run
        exit_code = Brilliant::Compiler.new(source_code).run
        exit(exit_code)
      else
        Brilliant::Compiler.new(source_code).save_bitcode("#{output_file_name}.bc")
        system("llc -filetype=obj #{output_file_name}.bc -o #{output_file_name}.o")
        system("clang #{output_file_name}.o -o #{output_file_name}")
        system("rm #{output_file_name}.bc #{output_file_name}.o")
      end
    end

    def file_name
      ARGV.first
    end

    def output_file_name
      File.basename(file_name, File.extname(file_name))
    end

    def source_code
      File.read(file_name)
    end

    def process_options
      if ARGV.first == "--run"
        @action = :run
        ARGV.shift
      else
        @action = :compile
      end
    end
  end
end
