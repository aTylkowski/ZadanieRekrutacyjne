import UIKit

final class ProductsListView: UITableView {
    init() {
        super.init(frame: .zero, style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
