require "brilliant/ast/node"


class Brilliant::AST::Return < Brilliant::AST::Node
  attr_accessor :return_expression

  def initialize(child_nodes)
    self.return_expression = child_nodes.first
  end

  def generate_code(mod, builder)
    builder.ret(return_expression.generate_code(mod, builder))
  end
end
