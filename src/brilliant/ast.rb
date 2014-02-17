module Brilliant::AST
end


Dir[File.dirname(__FILE__) + "/ast/*.rb"].each {|file| require file }
