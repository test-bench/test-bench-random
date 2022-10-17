require_relative '../automated_init'

context "Reset" do
  context "Namespace Argument Given" do
    control_namespace = Controls::Seed::Namespace.other_example

    root_seed = Controls::Seed.example

    random = TestBench::Random.build(root_seed)

    original_value = random.generator.rand

    seed = random.reset(control_namespace)

    context "Seed" do
      control_seed = TestBench::Random.generator_seed(root_seed, control_namespace)

      comment seed.inspect
      detail "Control: #{control_seed.inspect}"

      test "Calculated from given namespace" do
        assert(seed == control_seed)
      end
    end

    context "Namespace" do
      namespace = random.namespace

      comment namespace.inspect
      detail "Control: #{control_namespace.inspect}"

      test "Set" do
        assert(namespace == control_namespace)
      end
    end

    context "Next Values" do
      value_1 = random.generator.rand

      random.reset(control_namespace)

      value_2 = random.generator.rand

      comment "First Value: #{value_1.inspect}"
      comment "Second Value: #{value_2.inspect}"
      detail "Original Value: #{original_value.inspect}"

      context "Generator is reset" do
        is_reset = value_1 == value_2

        test do
          assert(is_reset)
        end
      end

      context "Given namespace is used" do
        namespace_changed = value_1 != original_value

        test do
          assert(namespace_changed)
        end
      end
    end
  end
end
