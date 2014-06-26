source "https://rubygems.org"

# We're using Rake 10.0 due to ruby-llvm depending on it.
gem "rake", "10.0"

gem "cucumber", "~> 1.3"
gem "rspec", "~> 2.14"
gem "aruba", "~> 0.5.4"

# We're using Ruby-LLVM from GitHub master, as 3.4.0 doesn't compile for us, and 3.4.1 doesn't work with LLVM 3.4.1.
gem "ruby-llvm", git: "https://github.com/ruby-llvm/ruby-llvm", branch: 'master' # "~> 3.4.2"
gem "rattler", git: "https://github.com/jarhart/rattler" # "~> 0.7.0"
