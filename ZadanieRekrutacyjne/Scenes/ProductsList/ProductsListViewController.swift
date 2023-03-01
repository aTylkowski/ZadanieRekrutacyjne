import UIKit

final class ProductsListViewController: UIViewController {
    private let productsListView: ProductsListView

    init(viewModel: ProductListViewModelProtocol) {
        productsListView = ProductsListView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = productsListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        productsListView.fetchProducts()
    }
}

