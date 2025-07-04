require_relative '../../automated_init'

context "Generator" do
  context "Substitute" do
    context "Seed" do
      context "Default" do
        substitute = Generator::Substitute.build

        default_seed = substitute.seed
        control_seed = Generator::Substitute::Generator.seed

        comment default_seed.inspect
        detail "Control: #{control_seed.inspect}"

        test do
          assert(default_seed == control_seed)
        end
      end

      context "Overridden" do
        substitute = Generator::Substitute.build

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
end
