// https://www.geeksforgeeks.org/median-of-two-sorted-arrays/
var a1 = [1, 12, 15, 26, 38]
var a2 = [2, 13, 17, 30, 45]
// combine two sorted arrays
func combineSortedArrays(a: [Int], b: [Int]) {
    var c = Array(repeating: 0, count: a.count + b.count)
    var i = 0
    var cIndex = 0
    let mid = a1.count
    let high = a2.count
    var j = 0
    while i < mid && j < high {
        if(a[i] < b[j]) {
            c[cIndex] = a[i]
            cIndex = cIndex + 1
            i = i + 1
        } else {
            c[cIndex] = b[j]
            cIndex = cIndex + 1
            j = j + 1
        }
    }
    while i<mid {
        c[cIndex] = a[i]
        cIndex = cIndex+1
        i = i+1
    }
    while j<high {
        c[cIndex] = b[j]
        cIndex = cIndex+1
        j = j+1
    }
    print(c)
}
combineSortedArrays(a: a1, b: a2)
