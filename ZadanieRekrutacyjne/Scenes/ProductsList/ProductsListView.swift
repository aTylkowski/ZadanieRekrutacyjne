import UIKit

final class ProductsListView: UITableView {
    private let viewModel: ProductListViewModelProtocol
    var showAlertHandler: ((String) -> (Void))?

    init(viewModel: ProductListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero, style: .plain)

        delegate = viewModel.dataSource
        dataSource = viewModel.dataSource
        register(ProductListCell.self, forCellReuseIdentifier: ProductListCell.id)
        separatorStyle = .none
        backgroundColor = Colors.background
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fetchProducts() {
        viewModel.fetchProducts { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.reloadData()
                }
            case .failure(let error):
                self.showAlertHandler?(error.localizedDescription)
            }
        }
    }
}
