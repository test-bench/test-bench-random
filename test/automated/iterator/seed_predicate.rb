require_relative '../automated_init'

context "Iterator" do
  context "Seed Predicate" do
    control_seed = Controls::Seed.example

    context "Given Seed Corresponds With Iterator's Seed" do
      seed = control_seed

      iterator = Iterator.build(control_seed)

      is_seed = iterator.seed?(seed)

      test do
        assert(is_seed)
      end
    end

    context "Given Seed Doesn't Correspond With Iterator's Seed" do
      seed = Controls::Seed.other_example

      iterator = Iterator.build(control_seed)

      is_seed = iterator.seed?(seed)

      test do
        refute(is_seed)
      end
    end
  end
end
