require "benchmark"

def benchmark!
  Benchmark.bm do |bench|

    bench.report("BSON::Buffer#write_cstring -->") do
      1_000_000.times do |n|
        BSON::Buffer.new.write_cstring("field")
      end
    end

    GC.start

    bench.report("BSON::Buffer#write_int32 ---->") do
      1_000_000.times do |n|
        BSON::Buffer.new.write_int32(100)
      end
    end

    GC.start

    bench.report("BSON::Buffer#write_string --->") do
      1_000_000.times do |n|
        BSON::Buffer.new.write_string("testing")
      end
    end

    GC.start

  end
end
