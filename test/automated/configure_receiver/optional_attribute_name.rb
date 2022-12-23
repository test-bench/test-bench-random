require_relative '../automated_init'

context "Configure Receiver" do
  context "Optional Attribute Name" do
    attr_name = :some_attr
    comment "Attribute Name: #{attr_name.inspect}"

    receiver = Struct.new(attr_name).new

    TestBench::Random.configure(receiver, attr_name:)

    random = receiver.public_send(attr_name)

    context "Configured" do
      configured = random.instance_of?(TestBench::Random)

      test do
        assert(configured)
      end
    end
  end
end
