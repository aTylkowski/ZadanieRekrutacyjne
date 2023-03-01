import UIKit

class ProductListCell: UITableViewCell, Identifiable {
    private enum Constants {
        static let containerViewPadding = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        static let productImageViewPadding = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 0)
        static let containerViewCornerRadius: CGFloat = 10
        static let imageViewCornerRadius: CGFloat = 30
        static let imageViewSize = CGSize(width: 60, height: 60)
    }

    private let containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = Colors.cell
        containerView.layer.cornerRadius = Constants.containerViewCornerRadius
        return containerView
    }()

    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Constants.imageViewCornerRadius
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.constraintEdges(to: contentView, insets: Constants.containerViewPadding)

        containerView.addSubview(productImageView)
        productImageView.constraint(to: containerView, edges: [.leading, .top, .bottom], insets: Constants.productImageViewPadding)
        productImageView.constraintSize(to: Constants.imageViewSize)
    }

    func configure(for product: Product) {
        productImageView.loadImage(withUrl: product.imageUrl)
    }
}
