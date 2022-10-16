require_relative 'automated_init'

context "String" do
  random = TestBench::Random.build

  string = random.string

  comment string.inspect

  test! "Provides a string" do
    assert(string.is_a?(String))
  end

  context "Provides random values" do
    next_string = random.string

    comment next_string.inspect

    random_values = next_string != string

    test do
      assert(random_values)
    end
  end
end
