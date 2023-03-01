import Foundation

protocol Identifiable {
    static var id: String { get }
}

extension Identifiable {
    static var id: String { String(describing: self) }
}
