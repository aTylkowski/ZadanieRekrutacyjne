import Foundation

typealias SequenceOptionSet = OptionSet & Sequence

extension OptionSet where Self.RawValue == Int {
    public func makeIterator() -> OptionSetIterator<Self> {
        return OptionSetIterator(element: self)
    }
}
