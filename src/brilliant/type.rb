module Type
  Void = LLVM::Type.void
  Integer = LLVM::Int
  Byte = LLVM::Int8
  Text = LLVM::Type.pointer(Byte)

  def self.of(type)
    const_get(type)
  end
end
