require "brilliant/ast/node"
require "brilliant/type"
require "llvm/core"


class Brilliant::AST::FunctionDefinition < Brilliant::AST::Node
  attr_accessor :function_name
  attr_accessor :function_signature
  attr_accessor :code_block

  def initialize(child_nodes)
    self.function_name = child_nodes[0]
    self.function_signature = child_nodes[1]
    self.code_block = child_nodes[-1]
  end

  def generate_code(mod, builder)
    return_type = Type.of(function_signature.return_type)
    mod.functions.add(function_name, [], return_type) do |function|
      function.basic_blocks.append("entry").build do |builder|
        code_block.generate_code(mod, builder)
        if return_type == Type::Void
          builder.ret_void
        else
          # No implicit return yet. Function must end with an explicit `return`.
        end
      end
    end
  end
end
