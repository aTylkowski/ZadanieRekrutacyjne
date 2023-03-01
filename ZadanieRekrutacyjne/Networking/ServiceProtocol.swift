import Foundation

public typealias Headers = [String: String]

public protocol ServiceProtocol {
    var baseUrl: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: Headers? { get }
}
