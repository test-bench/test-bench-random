# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'test_bench-random'
  s.version = '2.0.0.1'

  s.authors = ['Nathan Ladd']
  s.email = 'nathanladd+github@gmail.com'
  s.homepage = 'https://github.com/test-bench/test-bench-random'
  s.licenses = %w(MIT)
  s.summary = "Random value controls for TestBench"
  s.platform = Gem::Platform::RUBY

  s.require_paths = %w(lib)
  s.files = Dir.glob 'lib/**/*'

  s.add_development_dependency 'test_bench-bootstrap'
end
