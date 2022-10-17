require_relative '../automated_init'

context "Reset" do
  context "Default Seed" do
    random = TestBench::Random.new
    random.reset

    seed = random.seed
    comment seed.inspect

    test "Set" do
      refute(seed.nil?)
    end
  end
end
