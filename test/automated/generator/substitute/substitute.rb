require_relative '../../automated_init'

context "Generator" do
  context "Substitute" do
    substitute = Generator::Substitute.build

    test "Is a random generator" do
      assert(substitute.is_a?(Generator))
    end

    test "Isn't the singleton" do
      refute(substitute == Generator.instance)
    end
  end
end
