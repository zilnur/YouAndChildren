//
//  FirstHeaderView.swift
//  YouAndChildren
//
//  Created by Ильнур Закиров on 24.10.2022.
//

import UIKit

class FirstHeaderView: UIView {

    private let label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Персональные данные"
        view.font = UIFont.systemFont(ofSize: 20)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(label)
        label.anchor(top: topAnchor,
                     leading: leadingAnchor,
                     bottom: bottomAnchor,
                     trailing: trailingAnchor,
                     padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 20))
    }
}
