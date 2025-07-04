require_relative 'automated_init'

context "String" do
  singleton_generator = Generator.instance
  singleton_generator.reset

  control_string = singleton_generator.string

  singleton_generator.reset

  string = TestBench::Random.string

  comment string.inspect
  detail "Control: #{control_string.inspect}"

  test do
    assert(string == control_string)
  end
end
