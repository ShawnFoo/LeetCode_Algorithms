/*
 ZigZag Conversion
 
 Tag: String
 
 https://leetcode.com/problems/zigzag-conversion/description/
*/

/**
 思路: 从垂直角度 观察ZigZag串, 发现相当于把字符串的每个字符 按照行数从上到下排列, 当到最后一行后, 改变方向从下到上继续排列字符. 当到第一行时, 同理.
 
 比如: "PAYPALISHIRING"
 行号
 0  P   A   H   N
 1  A P L S I I G
 2  Y   I   R
 */
func convert(_ s: String, _ numRows: Int) -> String {
    if numRows <= 1 || s.count < numRows {
        return s
    }
    let chars = Array(s)
    var rowStrings: [String] = Array(repeating: "", count: numRows) // 用于保存 每一行的字符串
    var row = 0 // 当前为第几行
    var downward = true // 当前是否为从上往下排序
    // 1. 遍历字符 到对应行号的数组中
    for i in 0..<chars.count {
        rowStrings[row].append(chars[i])
        if downward {
            row += 1
            if row % numRows == 0 { // 当从上往下排到最后一行时, 开始变换方向
                row = numRows - 2
                downward = false
            }
        }
        else {
            row -= 1
            if row < 0 { // 当从下往上排到第一行时, 切换方向继续
                row = 1
                downward = true
            }
        }
    }
    // 2. 从第一行至最后一行 拼凑成新的ZigZag字符串
    var converted = ""
    for i in 0..<numRows {
        converted += rowStrings[i]
    }
    return converted;
}

convert("PAYPALISHIRING", 3)

