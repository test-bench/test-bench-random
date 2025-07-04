require_relative '../automated_init'

context "Generator" do
  context "Reset" do
    control_seed = Controls::Seed.example

    generator = Generator.new(control_seed)

    iterator = Iterator.build(control_seed)
    iterator.next

    generator.iterator = iterator

    generator.reset

    test "Generator is reset" do
      assert(generator.reset?)
    end
  end
end
