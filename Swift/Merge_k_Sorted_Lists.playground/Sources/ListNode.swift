import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        var desc = ""
        var node: ListNode? = self
        while node != nil {
            desc += desc.count == 0 ? "\(node!.val)" : "->\(node!.val)"
            node = node!.next
        }
        return desc
    }
}
