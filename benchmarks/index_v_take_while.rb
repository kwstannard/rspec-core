require 'benchmark'

n = 100

list = 1.upto(10).to_a

Benchmark.benchmark do |bm|
  3.times do
    bm.report do
      n.times do
        list.
          take_while {|i| i < 6}.
          map {|i| i}.
          compact
      end
    end
  end

  3.times do
    bm.report do
      n.times do
        if index = list.index(6)
          list[0, index].map {|i| i.to_s}
        else
          list.map {|i| i}.compact
        end
      end
    end
  end
end
