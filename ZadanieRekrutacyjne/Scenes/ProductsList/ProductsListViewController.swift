import UIKit

final class ProductsListViewController: UIViewController {
    private let viewModel: ProductListViewModelProtocol

    init(viewModel: ProductListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = ProductsListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchProducts()
    }
}

