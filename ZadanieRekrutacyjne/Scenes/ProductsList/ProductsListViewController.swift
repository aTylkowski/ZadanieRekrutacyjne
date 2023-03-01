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
        productsListView.showAlertHandler? = { [weak self] text in
            self?.showAlert(withText: text)
        }
    }

    private func showAlert(withText text: String) {
        let alert = UIAlertController(title: "Failed to fetch products", message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

