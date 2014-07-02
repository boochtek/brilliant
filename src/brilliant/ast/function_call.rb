require "brilliant/ast/node"
require "llvm/core"


class Brilliant::AST::FunctionCall < Brilliant::AST::Node
  attr_accessor :function_name
  attr_accessor :argument_list

  def initialize(child_nodes)
    self.function_name = child_nodes.first
    self.argument_list = child_nodes.last
  end

  def generate_code(mod, builder)
    args = argument_list.map{|arg| arg.generate_code(mod, builder)}
    builder.call(mod.functions[function_name], *args)
  end
end
