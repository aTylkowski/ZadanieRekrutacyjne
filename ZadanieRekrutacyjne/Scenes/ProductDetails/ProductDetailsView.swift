import UIKit

final class ProductDetailsView: UIView {
    private let product: Product

    init(product: Product) {
        self.product = product
        super.init(frame: .zero)
        backgroundColor = Colors.secondaryBackground
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
