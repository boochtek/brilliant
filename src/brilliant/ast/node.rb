class Brilliant::AST::Node
  # Rattler hands us an array containing the child nodes, which will be strings or AST nodes.
  def initialize(child_nodes)
    raise NotImplementedError
  end

  def generate_code(mod, builder)
    raise NotImplementedError
  end
end
