require_relative '../automated_init'

context "Reset Predicate" do
  context "Optional Namespace Argument Given" do
    control_namespace = 'some-namespace'

    random = TestBench::Random.new
    random.namespace = control_namespace

    random.next_qword

    random.reset

    context "Namespace Corresponds With Generator's Namespace" do
      namespace = control_namespace

      reset = random.reset?(namespace)

      test "Reset" do
        assert(reset)
      end
    end

    context "Namespace Doesn't Correspond With Generator's Namespace" do
      namespace = 'some-other-namespace'

      reset = random.reset?(namespace)

      test "Not reset" do
        refute(reset)
      end
    end
  end
end
