require_relative 'automated_init'

context "Reset" do
  context "Namespace Digest" do
    namespace = '1122334455667788'

    control_digest = 0x3131323233333434 ^ 0x3535363637373838 ^ 0xFFFFFFFFFFFFFFFF

    digest = TestBench::Random.namespace_digest(namespace)

    comment namespace.inspect
    comment "Digest: 0x#{digest.to_s(16)}"
    detail "Control Digest: 0x#{control_digest.to_s(16)}"

    test do
      assert(digest == control_digest)
    end
  end
end
