ary1 = [1, 2, 3]
ary2 = [1, [2]]
ary3 = [1, [2, 3, [4]], [1, [[[[5]]]]]]


def depth(array)
  func = lambda { |_array, n = 1|
    return n if _array.flatten == _array
    func.call(_array.flatten(1), n + 1)
  }

  func.call(array)
end

puts depth(ary1)
puts depth(ary2)
puts depth(ary3)