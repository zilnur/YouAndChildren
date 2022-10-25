import UIKit

class ChildTableViewCell: UITableViewCell, Subscriber {

    private let nameField = CustomTextFieldView(labellName: "Имя")
    private let ageField = CustomTextFieldView(labellName: "Возраст")
    private lazy var deleteButton = Button(text: "Удалить") { [weak self] in
        guard let self = self else {return}
        self.closure()
    }
    var closure = {}
    var indexPath: IndexPath?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func prepareForReuse() {
//        nameField.removeText()
//        ageField.removeText()
//    }
    
    private func setupViews() {
        [nameField,ageField, deleteButton].forEach(contentView.addSubview(_:))
        nameField.anchor(top: contentView.topAnchor,
                         leading: contentView.leadingAnchor,
                         bottom: nil,
                         trailing: nil,
                         padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 0),
                         size: CGSize(width: 200, height: 0))
        ageField.anchor(top: nameField.bottomAnchor,
                        leading: contentView.leadingAnchor,
                        bottom: contentView.bottomAnchor,
                        trailing: nil,
                        padding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 0),
                        size: CGSize(width: 200, height: 0))
        deleteButton.anchor(top: contentView.topAnchor,
                            leading: nameField.trailingAnchor,
                            bottom: nil,
                            trailing: nil,
                            padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 0),
                            size: CGSize(width: 100, height: 50))
    }
    
    func removeText() {
        nameField.removeText()
        ageField.removeText()
    }
    
    func id() -> IndexPath? {
        indexPath
    }

}
