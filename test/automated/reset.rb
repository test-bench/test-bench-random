require_relative 'automated_init'

context "Reset" do
  singleton_generator = Generator.instance

  singleton_generator.integer

  TestBench::Random.reset

  test "Resets the singleton instance" do
    assert(singleton_generator.reset?)
  end
end
