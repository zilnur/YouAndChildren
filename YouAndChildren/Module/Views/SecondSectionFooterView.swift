//
//  SecondSectionFooterView.swift
//  YouAndChildren
//
//  Created by Ильнур Закиров on 24.10.2022.
//

import UIKit

class SecondSectionFooterView: UIView {

    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button = Button(text: "Очистить",
                        titleColor: .red) { [weak self] in
        guard let self = self else { return }
        self.closure()
    }
    
    var closure: () -> ()
    
    init(closure: @escaping () -> ()) {
        self.closure = closure
        super.init(frame: .zero)
        backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [view, button].forEach(addSubview(_:))
        [view.centerXAnchor.constraint(equalTo: centerXAnchor),
        view.topAnchor.constraint(equalTo: topAnchor),
        view.heightAnchor.constraint(equalToConstant: 50),
        view.widthAnchor.constraint(equalToConstant: 200),
         view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ].forEach{$0.isActive = true}
        
        button.anchor(top: view.topAnchor,
                      leading: view.leadingAnchor,
                      bottom: view.bottomAnchor,
                      trailing: view.trailingAnchor)
    }
}
