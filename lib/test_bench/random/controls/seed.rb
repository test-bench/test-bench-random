module TestBench
  class Random
    module Controls
      module Seed
        def self.example
          1
        end

        module Namespace
          def self.example
            'some-seed-namespace'
          end

          def self.other_example
            'some-other-seed-namespace'
          end
        end
      end
    end
  end
end
