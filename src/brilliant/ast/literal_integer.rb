require "brilliant/ast/node"
require "llvm/core"


class Brilliant::AST::LiteralInteger < Brilliant::AST::Node
  attr_accessor :string_value

  def initialize(child_nodes)
    self.string_value = child_nodes.first
  end

  def value
    string_value.to_i
  end

  def generate_code(mod, builder)
    LLVM.Int(value)
  end
end


class Brilliant::AST::LiteralIntegerHex < Brilliant::AST::LiteralInteger
  def value
    string_value.to_i(16)
  end
end


class Brilliant::AST::LiteralIntegerOctal < Brilliant::AST::LiteralInteger
  def value
    string_value.to_i(8)
  end
end


class Brilliant::AST::LiteralIntegerBinary < Brilliant::AST::LiteralInteger
  def value
    string_value.to_i(2)
  end
end
