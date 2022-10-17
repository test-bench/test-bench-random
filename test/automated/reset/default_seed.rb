require_relative '../automated_init'

context "Reset" do
  context "Default Seed" do
    control_seed = Controls::Seed.example
    control_seed_text = Controls::Seed.text

    original_env = ::ENV.to_h

    ::ENV.replace({
      'TEST_BENCH_SEED' => control_seed_text
    })

    random = TestBench::Random.new
    random.reset

    seed = random.seed

    comment seed.to_s(16)
    detail "Control: #{control_seed.to_s(16)}"

    test "Converted from text" do
      assert(seed == control_seed)
    end

  ensure
    ::ENV.replace(original_env)
  end
end
