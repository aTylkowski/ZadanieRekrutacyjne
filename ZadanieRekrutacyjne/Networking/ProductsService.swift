import Foundation

enum ProductsService: ServiceProtocol {
    case productsList

    private static let mockedProductsListPath = "1c4cfa98-e329-4d49-8836-8ee195cec131"

    var baseUrl: URL {
        URL(string: "https://run.mocky.io/v3/")!
    }

    var path: String {
        switch self {
        case .productsList:
            return Self.mockedProductsListPath
        }
    }

    var method: HTTPMethod {
        switch self {
        case .productsList:
            return .get
        }
    }

    var headers: Headers? {
        switch self {
        case .productsList:
            return nil
        }
    }
}
