/*
 String to Integer (atoi)
 
 Tag: Math、 String
 
 https://leetcode.com/problems/string-to-integer-atoi/description/
 
 思路: 没想到什么特别的技巧, 主要得搞清楚 atoi 实现的要求即可.
*/

func myAtoi(_ str: String) -> Int {
    if str.count == 0 {
        return 0
    }
    
    // 获取unicode字符对应数值
    let plusCharValue = "+".unicodeScalars.first!.value
    let minusCharValue = "-".unicodeScalars.first!.value
    let zeroCharValue = "0".unicodeScalars.first!.value
    let nineCharValue = "9".unicodeScalars.first!.value
    let whiteSpaceCharValue = " ".unicodeScalars.first!.value
    
    let chars: [Character] = Array(str)
    var num: Int = 0
    var didBegin = false
    var isNegative = false
    outerFor: for i in 0..<chars.count {
        // 遍历字符, 检测字符unicode数值
        if let value = chars[i].unicodeScalars.first?.value {
            if !didBegin {
                // 若还没有开始数字匹配, 则跳过空白字符, 寻找0~9数字或正负号
                switch value {
                case whiteSpaceCharValue:
                    continue
                case plusCharValue, minusCharValue:
                    if value == minusCharValue {
                        isNegative = true
                    }
                    didBegin = true
                case zeroCharValue...nineCharValue:
                    num = Int(value - zeroCharValue)
                    didBegin = true
                default:
                    break outerFor
                }
            }
            else {
                // 开始匹配后, 如果是数字, 则继续匹配
                switch value {
                case zeroCharValue...nineCharValue:
                    num *= 10
                    let i = Int(value-zeroCharValue)
                    if isNegative {
                        num -= i
                    }
                    else {
                        num += i
                    }
                    // Int32边界检测
                    if num >= Int(Int32.max) {
                        num = Int(Int32.max)
                        break outerFor
                    }
                    else if num <= Int(Int32.min) {
                        num = Int(Int32.min)
                        break outerFor
                    }
                default:
                    break outerFor
                }
            }
        }
        else {
            break
        }
    }
    return num
}

myAtoi("+1")


