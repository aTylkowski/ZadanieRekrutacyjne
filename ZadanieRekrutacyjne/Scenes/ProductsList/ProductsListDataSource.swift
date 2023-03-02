import UIKit

final class ProductsListDataSource: NSObject {
    var products: [Product] = []
    var didSelectProductHandler: ((Product) -> (Void))?
}

extension ProductsListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductListCell.id, for: indexPath) as? ProductListCell else { return UITableViewCell() }
        cell.configure(for: products[indexPath.row])
        return cell
    }
}

extension ProductsListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectProductHandler?(products[indexPath.row])
    }
}
