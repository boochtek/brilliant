require "brilliant/ast/node"
require "llvm/core"


class Brilliant::AST::LiteralText < Brilliant::AST::Node
  def initialize(child_nodes)
    @value = child_nodes.first[1..-2] # TODO: Don't understand why the parser isn't stripping the quotes for us.
  end

  def generate_code(mod, builder)
    builder.global_string_pointer(@value)
  end
end
