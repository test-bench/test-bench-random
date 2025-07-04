require_relative 'automated_init'

context "String" do
  singleton_generator = Generator.instance
  singleton_generator.reset

  control_integer = singleton_generator.integer

  singleton_generator.reset

  integer = TestBench::Random.integer

  comment "#{integer}"
  detail "Control: #{control_integer}"

  test do
    assert(integer == control_integer)
  end
end
