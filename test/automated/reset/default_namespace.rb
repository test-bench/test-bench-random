require_relative '../automated_init'

context "Reset" do
  context "Default Namespace" do
    random = TestBench::Random.new
    random.reset

    namespace = random.namespace
    comment namespace.inspect

    test "Program name" do
      assert(namespace == $PROGRAM_NAME)
    end
  end
end
