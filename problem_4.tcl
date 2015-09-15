
proc is_polindrom { n } {
  expr $n == [ string trimleft [ string reverse $n ] "0" ]
}

set max_n 0
for { set i 999 } { $i > 99 } {incr i -1} {
  for { set j 999 } { $j >= $i } {incr j -1} {
    set n [expr $i * $j ]
    if { $n < $max_n } {
      break
    }
    if { [ is_polindrom $n ] } {
      if { $n > $max_n } {
        set max_n $n
      }
    }
  }
}
      
puts "Answer: $max_n"
