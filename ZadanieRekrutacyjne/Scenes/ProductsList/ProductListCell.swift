import UIKit

final class ProductListCell: UITableViewCell, Identifiable {
    private enum Constants {
        static let containerViewPadding = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        static let productImageViewPadding = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 0)
        static let containerViewCornerRadius: CGFloat = 10
        static let imageViewCornerRadius: CGFloat = 30
        static let imageViewSize = CGSize(width: 60, height: 60)
        static let stackViewPadding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12)
        static let stackViewSpacing: CGFloat = 4
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

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = Colors.primary
        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = Colors.secondary
        return label
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.stackViewSpacing
        stackView.axis = .vertical
        return stackView
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
        contentView.addSubview(stackView)

        containerView.constraintEdges(to: contentView,
                                      insets: Constants.containerViewPadding)
        containerView.addSubview(productImageView)

        productImageView.constraint(to: containerView,
                                    edges: [.leading, .top, .bottom],
                                    insets: Constants.productImageViewPadding)
        productImageView.constraintSize(to: Constants.imageViewSize)

        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.constraint(to: containerView,
                             edges: [.trailing, .centerY],
                             insets: Constants.stackViewPadding)
    }

    func configure(for product: Product) {
        productImageView.loadImage(withUrl: product.imageUrl)
        priceLabel.text = String(product.price)
        nameLabel.text = product.name
    }
}
