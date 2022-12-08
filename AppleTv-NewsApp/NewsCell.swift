//
//  NewsCell.swift
//  AppleTv-NewsApp
//
//  Created by Abhilash k George on 06/12/22.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var unfocussedConstraint: NSLayoutConstraint!
    
//MARK: Move the text view slightly down to match with the image view scalling

  //  var focussedConstraint: NSLayoutConstraint!
    

    
//    override func awakeFromNib() {
//        focussedConstraint = textLabel.topAnchor.constraint(equalTo: imageView.focusedFrameGuide.bottomAnchor, constant: 15)
//    }

//    override func updateConstraints() {
//        super.updateConstraints()
//        focussedConstraint.isActive = isFocused
//        unfocussedConstraint.isActive = !isFocused
//    }

    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        setNeedsFocusUpdate()
        
        coordinator.addCoordinatedAnimations({
            self.layoutIfNeeded()
        })
    }
    
}
