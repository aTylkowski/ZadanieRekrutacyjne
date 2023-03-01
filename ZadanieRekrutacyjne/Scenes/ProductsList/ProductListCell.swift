import UIKit

class ProductListCell: UITableViewCell, Identifiable {
    private enum Constants {
        static let outerStackViewPadding = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }

    private let outerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = Colors.background
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
        contentView.addSubview(outerStackView)
        outerStackView.constraintEdges(to: contentView, insets: Constants.outerStackViewPadding)
    }

    func configure(for product: Product) { }
}
