require_relative '../automated_init'

context "Substitute" do
  substitute = TestBench::Random::Substitute.build

  test "Is a random generator" do
    assert(substitute.is_a?(TestBench::Random))
  end

  test "Isn't the singleton" do
    refute(substitute == TestBench::Random.instance)
  end
end
