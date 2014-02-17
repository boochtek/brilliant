Given "the program:" do |source_code|
  @source_code = source_code
end

When "the program is executed" do
  @actual_exit_code = Brilliant::Compiler.new(@source_code).run
end

Then "the exit code should be $n" do |expected_exit_code|
  expected_exit_code = expected_exit_code.to_i
  expect(@actual_exit_code).to eq(expected_exit_code)
end
