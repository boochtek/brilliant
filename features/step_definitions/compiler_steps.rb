Given "the program:" do |source_code|
  write_file(source_file, source_code)
end

When "running the program:" do |source_code|
  write_file(source_file, source_code)
  run_program
end

When "the program is executed" do
  run_program
end

Then "the output should be:" do |expected_output|
  expect(actual_output).to eq(expected_output)
end

Then "the exit code should be $n" do |expected_exit_code|
  expected_exit_code = expected_exit_code.to_i
  expect(actual_exit_code).to eq(expected_exit_code)
end


require "aruba/cucumber"

def run_program
  run_simple("#{compiler} --run #{source_file}", false)
end

def actual_exit_code
  last_exit_status
end

def actual_output
  all_output.strip
end

def compiler
  "#{Dir.getwd}/bin/brilliant"
end

def source_file
  "source.bril"
end
