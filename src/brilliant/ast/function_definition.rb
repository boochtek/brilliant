require "brilliant/ast/node"
require "llvm/core"


class Brilliant::AST::FunctionDefinition < Brilliant::AST::Node
  def initialize(child_nodes)
    @function_name = child_nodes.first
    @code_block = child_nodes.last
  end

  def generate_code(mod, builder)
    return_type = LLVM.Void  # TODO: Need to determine the return type of the function.
    mod.functions.add(@function_name, [], LLVM.Void) do |function|
      function.basic_blocks.append("entry").build do |builder|
        @code_block.generate_code(mod, builder)
        builder.ret_void  # TODO: If the function does not return void, then use builder.ret() instead.
      end
    end
  end
end
