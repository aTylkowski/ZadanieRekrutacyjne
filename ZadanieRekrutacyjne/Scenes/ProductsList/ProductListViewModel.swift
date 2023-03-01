import Foundation

protocol ProductListViewModelProtocol {
    var dataSource: ProductsListDataSource { get set }
    func fetchProducts(completion: @escaping (Result<Void, Error>) -> Void)
}

final class ProductListViewModel: ProductListViewModelProtocol {
    private let networkManager = NetworkManager()
    var dataSource = ProductsListDataSource()

    func fetchProducts(completion: @escaping (Result<Void, Error>) -> Void) {
        networkManager.get(for: [Product].self, service: ProductsService.productsList) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let products):
                self.dataSource.products = products
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
