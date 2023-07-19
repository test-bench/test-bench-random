require_relative '../automated_init'

context "Reset Predicate" do
  context "Reset" do
    context "Sequence Is Zero" do
      random = TestBench::Random.new

      test do
        assert(random.reset?)
      end
    end

    context "Sequence Has Been Reset To Zero" do
      random = TestBench::Random.new

      random.next_qword

      random.reset

      test do
        assert(random.reset?)
      end
    end
  end

  context "Not Reset" do
    context "Sequence Is Greater Than Zero" do
      random = TestBench::Random.new

      random.next_qword

      test do
        refute(random.reset?)
      end
    end
  end
end
