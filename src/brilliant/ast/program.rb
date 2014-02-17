require "brilliant/ast/node"
require "llvm/core"


class Brilliant::AST::Program < Brilliant::AST::Node
  def initialize(child_nodes)
    @return_code = child_nodes.last
  end

  def generate_code(main_module)
    define_main(main_module)
  end

  private

  def define_main(main_module)
    # NOTE: C defines the exit code from `main` as a machine (typically 32-bit) int, but the UNIX shell treats it as an 8-bit int.
    main_module.functions.add('main', [], LLVM::Int32) do |function|
      function.basic_blocks.append.build do |b|
        b.ret @return_code.generate_code(main_module)
      end
    end
  end
end
