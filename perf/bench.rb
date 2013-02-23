require "benchmark"

def benchmark!
  Benchmark.bm do |bench|

    bench.report("MaxKey#to_bson ----->") do
      1_000_000.times do |n|
        BSON::MaxKey.new.to_bson
      end
    end
    GC.start

    bench.report("MinKey#to_bson ----->") do
      1_000_000.times do |n|
        BSON::MinKey.new.to_bson
      end
    end
    GC.start

    bench.report("String#to_bson ----->") do
      1_000_000.times do |n|
        "testing".to_bson
      end
    end
    GC.start

    bench.report("Timestamp#to_bson -->") do
      1_000_000.times do |n|
        BSON::Timestamp.new(10, 10).to_bson
      end
    end
    GC.start
  end
end
