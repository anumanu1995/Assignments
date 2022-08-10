$a = [1,2,3]
$a.freeze
b = $a
b << 0
puts $a
