import UIKit

final class ProductsListViewController: UIViewController {

    override func loadView() {
        super.loadView()
        view = ProductsListView()
    }
}

