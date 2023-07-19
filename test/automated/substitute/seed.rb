require_relative '../automated_init'

context "Substitute" do
  context "Seed" do
    context "Default" do
      substitute = TestBench::Random::Substitute.build

      default_seed = substitute.seed

      comment default_seed.inspect

      test "Zero" do
        assert(default_seed == 0)
      end
    end

    context "Overridden" do
      substitute = TestBench::Random::Substitute.build

      control_seed = Controls::Seed.example
      substitute.set_seed(control_seed)

      seed = substitute.seed

      comment seed.inspect
      detail "Control: #{control_seed.inspect}"

      test do
        assert(seed == control_seed)
      end
    end
  end
end
