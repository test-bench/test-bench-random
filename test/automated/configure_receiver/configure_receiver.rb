require_relative '../automated_init'

context "Configure Receiver" do
  attr_name = :random
  comment "Default Attribute Name: #{attr_name.inspect}"

  receiver = Struct.new(attr_name).new

  TestBench::Random.configure(receiver)

  random = receiver.random

  context "Configured" do
    configured = random.instance_of?(TestBench::Random)

    test do
      assert(configured)
    end
  end
end
