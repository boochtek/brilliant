require "llvm/core"


module Type
  Void = LLVM::Type.void
  Integer = LLVM::Int
  Int32 = LLVM::Int32
  Byte = LLVM::Int8
  Text = LLVM::Type.pointer(Byte)

  def self.of(type)
    const_get(type)
  end
end
