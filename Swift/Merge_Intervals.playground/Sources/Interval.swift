import Foundation

public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

extension Interval: CustomStringConvertible {
    public var description: String {
        return "[\(start),\(end)]"
    }
}
