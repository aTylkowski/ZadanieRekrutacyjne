import UIKit

final class ProductDetailsView: UIView {
    private enum Constants {
        static let containerViewCornerRadius: CGFloat = 10
        static let containerViewBorderWidth: CGFloat = 2
        static let containerViewSize = CGSize(width: UIScreen.main.bounds.width - 100, height: UIScreen.main.bounds.width - 100)
        static let containerViewSpacing: CGFloat = 10
        static let nameLabelFontSize: CGFloat = 18
        static let priceLabelFontSize: CGFloat = 32
        static let descriptionLabelFontSize: CGFloat = 12
        static let imageViewSize = CGSize(width: 100, height: 100)
        static let imageViewContainerHeight: CGFloat = 140
    }

    private let containerView: UIStackView = {
        let containerView = UIStackView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.spacing = Constants.containerViewSpacing
        containerView.axis = .vertical
        containerView.layer.borderColor = Colors.primary?.cgColor
        containerView.layer.borderWidth = Constants.containerViewBorderWidth
        containerView.layer.cornerRadius = Constants.containerViewCornerRadius
        return containerView
    }()

    private let imageViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = Constants.containerViewCornerRadius
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.secondary
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: Constants.nameLabelFontSize, weight: .heavy)
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.primary
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: Constants.priceLabelFontSize, weight: .bold)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.secondary
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: Constants.descriptionLabelFontSize, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()

    private let emptyView = UIView()

    private let product: Product

    init(product: Product) {
        self.product = product
        super.init(frame: .zero)
        setupUI()
        configure(with: product)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = Colors.secondaryBackground
        addSubview(containerView)
        containerView.constraint(to: self,
                                 edges: [.centerY, .centerX])
        containerView.constraintSize(to: Constants.containerViewSize)

        imageViewContainer.addSubview(imageView)
        imageViewContainer.constraintHeight(to: Constants.imageViewContainerHeight)
        imageView.constraint(to: imageViewContainer,
                             edges: [.centerX, .centerY])
        imageView.constraintSize(to: Constants.imageViewSize)

        containerView.addArrangedSubview(imageViewContainer)
        containerView.addArrangedSubview(nameLabel)
        containerView.addArrangedSubview(priceLabel)
        containerView.addArrangedSubview(descriptionLabel)
        containerView.addArrangedSubview(emptyView)
    }

    private func configure(with product: Product) {
        nameLabel.text = product.name
        priceLabel.text = String(product.price)
        descriptionLabel.text = product.description
        imageView.loadImage(withUrl: product.imageUrl)
    }
}
