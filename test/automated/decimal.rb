require_relative 'automated_init'

context "Decimal" do
  singleton_generator = Generator.instance
  singleton_generator.reset

  control_decimal = singleton_generator.decimal

  singleton_generator.reset

  decimal = TestBench::Random.decimal

  comment("%0.16E" % decimal)
  detail("Control: %0.16E" % control_decimal)

  test do
    assert(decimal == control_decimal)
  end
end
