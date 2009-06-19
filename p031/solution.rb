combinations = 0
(0..1).each do |f2|
  sum = f2*200
  combinations += 1 if sum == 200
  break if sum >= 200
  (0..2).each do |f1|
    sum = f2*200+f1*100
    combinations += 1 if sum == 200
    break if sum >= 200
    (0..4).each do |p50|
      sum = f2*200+f1*100+p50*50
      combinations += 1 if sum == 200
      break if sum >= 200
      (0..10).each do |p20|
        sum = f2*200+f1*100+p50*50+p20*20
        combinations += 1 if sum == 200
        break if sum >= 200
        (0..20).each do |p10|
          sum = f2*200+f1*100+p50*50+p20*20+p10*10
          combinations += 1 if sum == 200
          break if sum >= 200
          (0..40).each do |p5|
            sum = f2*200+f1*100+p50*50+p20*20+p10*10+p5*5
            combinations += 1 if sum == 200
            break if sum >= 200
            (0..100).each do |p2|
              sum = f2*200+f1*100+p50*50+p20*20+p10*10+p5*5+p2*2
              combinations += 1 if sum == 200
              break if sum >= 200
              combinations += 1
            end
          end
        end
      end
    end
  end
end
puts combinations