import UIKit

final class ProductsListViewController: UIViewController {
    private let productsListView: ProductsListView

    private let refreshButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.refresh, for: .normal)
        return button
    }()

    init(viewModel: ProductListViewModelProtocol) {
        productsListView = ProductsListView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)

        viewModel.dataSource.didSelectProductHandler = { [weak self] product in
            self?.showProductDetails(for: product)
        }
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
        setupRefreshButton()
    }

    private func setupRefreshButton() {
        refreshButton.addTarget(self, action: #selector(didTapRefreshButton), for: .touchUpInside)

        let barButton = UIBarButtonItem(customView: refreshButton)
        navigationItem.rightBarButtonItem = barButton
    }

    private func showAlert(withText text: String) {
        let alert = UIAlertController(title: "Failed to fetch products", message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    private func showProductDetails(for product: Product) {
        let productDetailsViewController = ProductDetailsViewController(product: product)
        navigationController?.pushViewController(productDetailsViewController, animated: true)
    }

    @objc
    private func didTapRefreshButton() {
        productsListView.fetchProducts()
    }
}

