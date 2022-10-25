import UIKit

class ParentTableViewCell: UITableViewCell, Subscriber {

    private let nameField = CustomTextFieldView(labellName: "Имя",keyboardType: .alphabet)
    private let ageField = CustomTextFieldView(labellName: "Возраст", keyboardType: .numberPad)
    var indexPath: IndexPath?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [nameField,ageField].forEach(contentView.addSubview(_:))
        nameField.anchor(top: contentView.topAnchor,
                         leading: contentView.leadingAnchor,
                         bottom: nil,
                         trailing: contentView.trailingAnchor,
                         padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20))
        ageField.anchor(top: nameField.bottomAnchor,
                        leading: contentView.leadingAnchor,
                        bottom: contentView.bottomAnchor,
                        trailing: contentView.trailingAnchor,
                        padding: UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20))
    }
    
    func removeText() {
        nameField.removeText()
        ageField.removeText()
    }
    
    func id() -> IndexPath? {
        indexPath
    }
}
