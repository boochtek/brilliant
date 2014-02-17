require "brilliant/ast/node"
require "llvm/core"


class Brilliant::AST::LiteralInteger < Brilliant::AST::Node
  def initialize(child_nodes)
    @value = child_nodes.first.to_i
  end

  def generate_code(mod)
    LLVM.Int(@value)
  end
end
