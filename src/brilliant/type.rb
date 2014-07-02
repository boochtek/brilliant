module Type
  Void = LLVM::Type.void
  Integer = LLVM::Int

  def self.of(type)
    const_get(type)
  end
end
