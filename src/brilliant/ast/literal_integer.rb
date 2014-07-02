require "brilliant/ast/node"
require "llvm/core"


class Brilliant::AST::LiteralInteger < Brilliant::AST::Node
  attr_accessor :value

  def initialize(child_nodes)
    self.value = child_nodes.first.to_i
  end

  def generate_code(mod, builder)
    LLVM.Int(value)
  end
end
