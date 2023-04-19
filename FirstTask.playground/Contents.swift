import UIKit

// Заменить в массиве отрицательные числа нулем
var arrays = [-1, 2, 4, 0, -6, 39, 10]

for (index, item) in arrays.enumerated() {
    if item < 0 {
        arrays[index] = 0
    }
}

print(arrays)

// Сортировка массива по убыванию(возрастанию)

enum SortProperties {
    case asc
    case desc
}

func sortArray<T: Comparable>(arrays: inout [T], sortProperties: SortProperties) -> [T] {
    let size = arrays.count
    
    switch sortProperties {
    case .asc:
        for i in 0..<size {
            var pass = (size - 1) - i
            for j in 0..<pass {
                var curr = arrays[j]
                if curr > arrays[j + 1] {
                    let temp = arrays[j + 1]
                    arrays[j] = temp
                    arrays[j + 1] = curr
                }
            }
        }
        break
    case .desc:
        for i in 0..<size {
            var pass = (size - 1) - i
            for j in 0..<pass {
                var curr = arrays[j]
                if curr < arrays[j + 1] {
                    let temp = arrays[j + 1]
                    arrays[j] = temp
                    arrays[j + 1] = curr
                }
            }
        }
        break
    }
    return arrays
}
print(sortArray(arrays: &arrays, sortProperties: .asc))
print(sortArray(arrays: &arrays, sortProperties: .desc))

// Найти max(min) элемент в массиве

//max
func max<T: Comparable>(arrays: [T]) -> T {
    let size = arrays.count
    var max = arrays[0]
    
    for i in 0..<size - 1 {
        if(arrays[i + 1] > max) {
            max = arrays[i + 1]
        }
    }
    return max
}

print(max(arrays: arrays))

//min
func min<T: Comparable>(arrays: [T]) -> T {
    let size = arrays.count
    var min = arrays[0]
    
    for i in 0..<size - 1 {
        if(arrays[i + 1] < min) {
            min = arrays[i + 1]
        }
    }
    return min
}

print(min(arrays: arrays))

//Найти сумму элементов массива
func sum<T: Numeric>(arrays: [T]) -> T {
    var sum: T = 0
    for item in arrays {
        sum += item
    }
    return sum
}

print(sum(arrays: arrays))
