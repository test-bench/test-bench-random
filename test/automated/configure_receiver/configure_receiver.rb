require_relative '../automated_init'

context "Configure Receiver" do
  attr_name = :random
  comment "Default Attribute Name: #{attr_name.inspect}"

  receiver = Struct.new(attr_name).new

  TestBench::Random.configure(receiver)

  context "Receiver's Random Generator" do
    random = receiver.public_send(attr_name)

    configured = random.instance_of?(TestBench::Random) &&
      random == TestBench::Random.instance

    test "Configured" do
      assert(configured)
    end
  end
end
