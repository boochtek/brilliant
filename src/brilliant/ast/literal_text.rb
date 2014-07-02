require "brilliant/ast/node"
require "llvm/core"


class Brilliant::AST::LiteralText < Brilliant::AST::Node
  attr_accessor :value

  def initialize(child_nodes)
    self.value = child_nodes.first[1..-2] # Not sure why the parser isn't stripping the quotes for us; probably a bug.
  end

  def generate_code(mod, builder)
    builder.global_string_pointer(value)
  end
end
