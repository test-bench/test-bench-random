require_relative 'automated_init'

context "Class Methods" do
  context "String" do
    string = TestBench::Random.string

    comment string.inspect

    test do
      assert(string.is_a?(String))
    end
  end

  context "Integer" do
    integer = TestBench::Random.integer

    comment integer.inspect

    test do
      assert(integer.is_a?(Integer))
    end
  end

  context "Fraction" do
    fraction = TestBench::Random.fraction

    comment fraction.inspect

    test do
      assert(fraction.is_a?(Float))
    end
  end

  context "Boolean" do
    boolean = TestBench::Random.boolean

    comment boolean.inspect

    is_boolean = boolean == true || boolean == false

    test do
      assert(is_boolean)
    end
  end

  context "Reset" do
    ## Remove
    TestBench::Random.reset

    control_string = TestBench::Random.string

    TestBench::Random.reset

    string = TestBench::Random.string

    test do
      assert(string == control_string)
    end
  end
end
