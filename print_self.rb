p $0
File.open($0, 'r') do |f|
  f.each_line do |line|
    puts line
  end
end
