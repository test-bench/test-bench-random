require_relative '../automated_init'

context "Configure Receiver" do
  context "Optional Attribute Name Argument" do
    attr_name = :some_other_attr
    comment "Attribute Name: #{attr_name.inspect}"

    receiver = Struct.new(attr_name).new

    TestBench::Random.configure(receiver, attr_name:)

    context "Receiver's Random Generator" do
      random = receiver.public_send(attr_name)

      configured = random.instance_of?(TestBench::Random)

      test "Configured" do
        assert(configured)
      end
    end
  end
end
