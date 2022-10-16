require_relative 'automated_init'

context "Random" do
  context "Boolean" do
    random = TestBench::Random.build

    true_count = 0
    false_count = 0

    iterations = 64

    iterations.times do
      boolean = random.boolean

      if boolean == true
        true_count += 1
      elsif boolean == false
        false_count += 1
      end
    end

    context "Either true or false" do
      all_true_or_false = (true_count + false_count) == iterations

      test do
        assert(all_true_or_false)
      end
    end

    context "Random" do
      random_values = !true_count.zero? && !false_count.zero?

      test do
        assert(random_values)
      end
    end

    context "Sequence" do
      incremented = random.sequence == iterations

      test "Incremented" do
        assert(incremented)
      end
    end
  end
end
