require "benchmark"

def benchmark!
  Benchmark.bm do |bench|

    bench.report("String#to_bson -->") do
      1_000_000.times do |n|
        "test".to_bson
      end
    end

    GC.start
  end
end
