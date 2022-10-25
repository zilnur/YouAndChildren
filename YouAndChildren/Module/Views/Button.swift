//
//  Button.swift
//  YouAndChildren
//
//  Created by Ильнур Закиров on 24.10.2022.
//

import UIKit

class Button: UIButton {
    
    var onTap: () -> ()

    init(text: String,
         image: UIImage? = nil,
         titleColor: UIColor = .systemBlue,
         onTap: @escaping () -> ()) {
        self.onTap = onTap
        super.init(frame: .zero)
        setTitle(text, for: .normal)
        if let image = image {
            self.setImage(image, for: .normal)
        }
        setTitleColor(titleColor, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped() {
        onTap()
    }
    
}
