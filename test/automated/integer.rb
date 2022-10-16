require_relative 'automated_init'

context "Integer" do
  random = TestBench::Random.build

  integer = random.integer

  comment integer.inspect

  context! "Integer between zero and 2⁶⁴" do
    is_integer = integer.is_a?(Integer)
    in_range = integer > 0 && integer < 2 ** 64

    test do
      assert(is_integer && in_range)
    end
  end

  context "Random" do
    next_integer = random.integer

    comment next_integer.inspect

    random_values = next_integer != integer

    test do
      assert(random_values)
    end
  end
end
