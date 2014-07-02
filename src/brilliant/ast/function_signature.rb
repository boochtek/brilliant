require "brilliant/ast/node"


class Brilliant::AST::FunctionSignature < Brilliant::AST::Node
  attr_accessor :return_type

  def initialize(child_nodes)
    self.return_type = child_nodes[-1]
  end
end
