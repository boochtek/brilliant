require "brilliant/ast/node"
require "llvm/core"


class Brilliant::AST::LiteralText < Brilliant::AST::Node
  attr_accessor :value

  def initialize(child_nodes)
    self.value = child_nodes.first
  end

  def generate_code(mod, builder)
    builder.global_string_pointer(value)
  end
end
