require_relative 'automated_init'

context "Boolean" do
  singleton_generator = Generator.instance
  singleton_generator.reset

  control_values = 10.times.map do
    singleton_generator.boolean
  end

  singleton_generator.reset

  values = 10.times.map do
    TestBench::Random.boolean
  end

  comment values.inspect
  detail "Control: #{control_values.inspect}"

  test do
    assert(values == control_values)
  end
end
