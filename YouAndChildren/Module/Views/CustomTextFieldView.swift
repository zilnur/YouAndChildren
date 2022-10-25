import UIKit

class CustomTextFieldView: UIView {

    private let textField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.contentVerticalAlignment = .bottom
        return view
    }()
    
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .lightGray
        return view
    }()
    
    init(labellName: String) {
        nameLabel.text = labellName
        super.init(frame: .zero)
        setupViews()
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "gray")?.cgColor
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(textField)
        addSubview(nameLabel)
        nameLabel.anchor(top: topAnchor,
                         leading: leadingAnchor,
                         bottom: nil,
                         trailing: nil,
                         padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0))
        textField.anchor(top: topAnchor,
                         leading: leadingAnchor,
                         bottom: bottomAnchor,
                         trailing: trailingAnchor,
                         padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0),
                         size: CGSize(width: 0, height: 60))
    }
    
    func removeText() {
        textField.text = nil
    }
}
