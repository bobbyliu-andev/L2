//
//  TopNavigationStackView.swift
//  L2
//
//  Created by Chang Liu on 3/11/19.
//  Copyright © 2019 Chang Liu. All rights reserved.
//

import UIKit

class TopNavigationStackView: UIStackView {

    let settingButton = UIButton.init(type: .system)
    let messageButton = UIButton(type: .system)
    let fireImageView = UIImageView(image: #imageLiteral(resourceName: "12"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        settingButton.setImage(#imageLiteral(resourceName: "11").withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.setImage(#imageLiteral(resourceName: "13").withRenderingMode(.alwaysOriginal), for: .normal)
        fireImageView.contentMode = .scaleAspectFit
        
        [settingButton, UIView(), fireImageView, UIView(), messageButton].forEach { v in
            addArrangedSubview(v)
        }
        
        distribution = .equalCentering
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
