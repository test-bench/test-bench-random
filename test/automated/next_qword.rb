require_relative 'automated_init'

context "Next Quad Word (64-bit Value)" do
  random = TestBench::Random.new

  original_sequence = 11
  random.sequence = original_sequence

  next_value = random.next_qword

  context "Is the generator's next eight bytes" do
    generator = TestBench::Random.generator(random.seed, random.namespace)

    generator_bytes = generator.bytes(8)

    comment next_value.inspect
    detail "Generator's Next Bytes: #{generator_bytes.inspect}"

    test do
      assert(next_value == generator_bytes)
    end
  end

  context "Sequence" do
    sequence = random.sequence

    comment sequence.inspect
    detail "Original Sequence: #{original_sequence.inspect}"

    test "Incremented" do
      assert(sequence == original_sequence + 1)
    end
  end
end
