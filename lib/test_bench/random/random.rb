module TestBench
  class Random
    def generator
      @generator ||= self.class.generator(seed, namespace)
    end
    attr_writer :generator

    def seed
      @seed ||= Defaults.seed
    end
    attr_writer :seed

    def namespace
      @namespace ||= Defaults.namespace
    end
    attr_writer :namespace

    def sequence
      @sequence ||= 0
    end
    attr_writer :sequence

    def self.build(seed=nil, namespace: nil)
      instance = new
      instance.seed = seed
      instance.namespace = namespace
      instance
    end

    def next_qword
      self.sequence += 1

      generator.bytes(8)
    end

    def reset(namespace=nil)
      namespace ||= self.namespace

      generator = self.class.generator(seed, namespace)

      self.generator = generator
      self.namespace = namespace

      self.sequence = 0

      generator.seed
    end

    def self.generator(seed, namespace)
      namespace_digest = namespace_digest(namespace)

      seed ^= namespace_digest

      ::Random.new(seed)
    end

    def self.generator_seed(seed, namespace)
      generator = generator(seed, namespace)
      generator.seed
    end

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

    module Defaults
      def self.seed
        seed = ENV['TEST_BENCH_SEED']
        if not seed.nil?
          seed.to_i(36)
        else
          ::Random.new_seed
        end
      end

      def self.namespace
        $PROGRAM_NAME
      end
    end
  end
end
