require "llvm/core"
require "llvm/execution_engine"
require "brilliant/ast"
require "brilliant/parser"


module Brilliant
  LLVM.init_jit

  class ParserError < RuntimeError; end

  class Compiler
    attr_accessor :source_code
    attr_accessor :main_module
    attr_accessor :engine

    def initialize(source_code)
      self.source_code = source_code
      self.main_module = LLVM::Module.new("Main")
      self.engine = LLVM::JITCompiler.new(main_module)
    end

    def run
      compile
      result = engine.run_function(main_module.functions[:main])
      result.to_i
    end

    def compile
      parser = Brilliant::Parser.new(source_code)
      program_node = parser.parse!
      program_node.generate_code(main_module)
    end
  end
end
