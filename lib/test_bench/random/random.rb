module TestBench
  class Random
    def self.namespace_digest(namespace)
      byte_width = 8

      sequence = namespace.bytes.each_slice(byte_width).map do |bytes|
        value = 0

        bytes.each_with_index do |byte, index|
          value <<= 8 if not index.zero?

          value += byte
        end

        value
      end

      digest_salt = (0x100 ** byte_width) - 1
      sequence.push(digest_salt)

      sequence.reduce do |checksum, value|
        checksum ^ value
      end
    end
  end
end
