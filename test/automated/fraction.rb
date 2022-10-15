require_relative 'automated_init'

context "Random" do
  context "Fraction" do
    random = TestBench::Random.build

    fraction = random.fraction

    comment fraction.inspect

    context "Decimal number between zero and one" do
      is_decimal = fraction.is_a?(Float)
      in_range = fraction > 0 && fraction < 1

      test do
        assert(is_decimal && in_range)
      end
    end

    context "Sequence" do
      incremented = random.sequence == 1

      test "Incremented" do
        assert(incremented)
      end
    end

    context "Random" do
      next_fraction = random.fraction

      comment next_fraction.inspect

      random_values = next_fraction != fraction

      test do
        assert(random_values)
      end
    end
  end
end
