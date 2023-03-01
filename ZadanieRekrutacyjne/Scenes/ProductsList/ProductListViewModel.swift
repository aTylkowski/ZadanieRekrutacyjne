import Foundation

protocol ProductListViewModelProtocol {
    func fetchProducts()
}

final class ProductListViewModel: ProductListViewModelProtocol {
    private let networkManager = NetworkManager()

    func fetchProducts() {
        networkManager.get(for: [Product].self, service: ProductsService.productsList) { result in
            switch result {
            case .success(let products):
                print(products)
            case .failure(let error):
                print(error)
            }
        }
    }
}
