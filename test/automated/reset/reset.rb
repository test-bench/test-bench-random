require_relative '../automated_init'

context "Reset" do
  context "Namespace Argument Omitted" do
    root_seed = Controls::Seed.example

    initial_namespace = Controls::Seed::Namespace.example

    random = TestBench::Random.build(root_seed, namespace: initial_namespace)

    random.sequence = 11

    original_value = random.generator.rand

    seed = random.reset

    context "Seed" do
      control_seed = TestBench::Random.generator_seed(root_seed, initial_namespace)

      comment seed.inspect
      detail "Control: #{control_seed.inspect}"

      test "Calculated from initial namespace" do
        assert(seed == control_seed)
      end
    end

    context "Next Value" do
      value = random.generator.rand

      comment value.inspect
      detail "Original Value: #{original_value.inspect}"

      context "Generator is reset" do
        is_reset = value == original_value

        test do
          assert(is_reset)
        end
      end
    end

    context "Sequence" do
      sequence = random.sequence

      comment sequence.inspect

      test "Reset" do
        assert(sequence.zero?)
      end
    end
  end
end
