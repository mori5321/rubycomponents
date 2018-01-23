ary1 = [1, 2, 3]
ary2 = [1, [2, 3]]
ary3 = [1, [2, 3, [4]]]


def depth(array)
  func = lambda { |_array, n = 0|
    return n if _array.flatten == _array
    func.call(_array.flatten(1), n + 1)
  }

  func.call(array)
end

depth(ary1)
depth(ary2)
depth(ary3)