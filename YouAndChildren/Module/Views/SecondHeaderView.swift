//
//  SeconHeaderView.swift
//  YouAndChildren
//
//  Created by Ильнур Закиров on 24.10.2022.
//

import UIKit

class SecondHeaderView: UIView {
    
    private let label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Дети(макс. 5)"
        view.font = UIFont.systemFont(ofSize: 20)
        return view
    }()
    
    private lazy var addCellButton = Button(text: "Добавить ребенка",
                                            image: UIImage(systemName: "plus")) { [weak self] in
        self?.onButtonTap()
    }
    
    var onButtonTap: () -> ()
    
    init(closure: @escaping () -> ()) {
        onButtonTap = closure
        super.init(frame: .zero)
        backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(label)
        addButton()
        label.anchor(top: topAnchor,
                     leading: leadingAnchor,
                     bottom: bottomAnchor,
                     trailing: nil,
                     padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
    }
    
    func addButton() {
        addSubview(addCellButton)
        addCellButton.anchor(top: topAnchor,
                             leading: label.trailingAnchor,
                             bottom: bottomAnchor,
                             trailing: trailingAnchor,
                             padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20),
                             size: CGSize(width: 200, height: 50))
    }
    
    func deactivateButton() {
            addCellButton.removeFromSuperview()
    }
    
}
