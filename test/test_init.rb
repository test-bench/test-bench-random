require_relative '../init'

require 'test_bench_isolated/test_bench'; TestBenchIsolated::TestBench.activate

require 'test_bench/random/controls'

include TestBench

Controls = TestBench::Random::Controls rescue nil
