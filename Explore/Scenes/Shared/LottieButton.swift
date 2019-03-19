//
//  LottieButton.swift
//  Explore
//
//  Created by Christian Graver on 19/03/2019.
//  Copyright © 2019 nordgrus. All rights reserved.
//

import UIKit
import SnapKit
import Lottie

//From https://github.com/alesker/LottieButton/blob/master/LottieButton/Classes/LottieButton.swift

open class LottieButton: UIButton {
    
    public private(set) var animationView: AnimationView?
    
    public var animationName: String? {
        didSet {
            guard let name = animationName else { return }
            self.animationView?.removeFromSuperview()
            self.animationView = AnimationView(name: name)
            
            if let animationView = self.animationView {
                self.add(animationView)
            }
        }
    }
    
    private func add(_ animationView: AnimationView) {
        self.addSubview(animationView)
        animationView.snp.makeConstraints { make in
            make.edges.equalTo(self.imageView!)
        }
        animationView.isHidden = true
    }
    
    private func blankImage(for image: UIImage?) -> UIImage? {
        UIGraphicsBeginImageContext(image?.size ?? .zero)
        let blankImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return blankImage
    }
    
    public func playAnimation(withInitialStateImage initialStateImage: UIImage,
                              andFinalStateImage finalStateImage: UIImage) {
        let blankImage = self.blankImage(for: initialStateImage)
        self.setImage(blankImage, for: .normal)
        self.animationView?.isHidden = false
        
        self.animationView?.play(completion: { completed in
            self.setImage(finalStateImage, for: .normal)
            self.animationView?.isHidden = true
            self.animationView?.pause()
            self.animationView?.currentProgress = 0.0
        })
    }
    
    open func playAnimation() {
        guard let image = self.image(for: .normal) else { return }
        self.playAnimation(withInitialStateImage: image, andFinalStateImage: image)
    }
}
