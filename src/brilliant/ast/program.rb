require "brilliant/ast/node"
require "llvm/core"


class Brilliant::AST::Program < Brilliant::AST::Node
  attr_accessor :child_nodes

  def initialize(child_nodes)
    self.child_nodes = child_nodes.first
  end

  def generate_code(main_module, builder = nil)
    define_external_functions(main_module)
    define_main(main_module)
  end

  private

  def define_external_functions(main_module)
    main_module.functions.add('exit', [LLVM::Int32], LLVM.Void) do |function, string|
      function.linkage = :external
    end
    main_module.functions.add('puts', [LLVM.Pointer(LLVM::Int8)], LLVM::Int32) do |function, string|
      function.linkage = :external
    end
  end

  def define_main(main_module)
    # NOTE: C defines the exit code from `main` as a machine (typically 32-bit) int, but the UNIX shell treats it as an 8-bit int.
    main_module.functions.add('main', [], LLVM::Int32) do |function|
      function.basic_blocks.append.build do |builder|
        child_nodes.each do |node|
          node.generate_code(main_module, builder)
        end
        builder.ret LLVM.Int(0)
      end
    end
  end
end
