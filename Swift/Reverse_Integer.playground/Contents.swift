/*
Reverse Integer

Tag: Math

https://leetcode.com/problems/reverse-integer/description/
*/

func reverse(_ x: Int) -> Int {
    if (x < 0) {
        return -reverse(-x);
    }
    var num = x
    var reversed = 0
    while num > 0 {
        reversed *= 10
        if reversed > Int32.max {
            return 0
        }
        reversed += num % 10
        num /= 10
    }
    return reversed
}
