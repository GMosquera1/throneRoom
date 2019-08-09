//
//  IBDesignable .swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 8/9/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

@IBDesignable
class CircularImageView: UIImageView {
    override func layoutSubviews() {
    super.layoutSubviews()
    contentMode = .scaleAspectFill
        layer.cornerRadius = bounds.width / 2.0
        layer.borderColor = #colorLiteral(red: 1, green: 0.7713925838, blue: 0.8318699598, alpha: 1)
        layer.borderWidth = 0.5
        clipsToBounds = true 
    }
}
