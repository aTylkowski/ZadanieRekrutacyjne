import UIKit

final class ProductDetailsViewController: UIViewController {
    private let productDetailsView: ProductDetailsView

    init(product: Product) {
        productDetailsView = ProductDetailsView(product: product)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = productDetailsView
    }
}
