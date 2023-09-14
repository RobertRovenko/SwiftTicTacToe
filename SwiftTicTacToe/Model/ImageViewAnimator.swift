//
//  ImageViewAnimator.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-14.
//

import Foundation
import UIKit

class ImageViewAnimator {
    private let imageView: UIImageView
    private let animationDuration: TimeInterval
    private let moveDistance: CGFloat

    init(imageView: UIImageView, animationDuration: TimeInterval = 2.0, moveDistance: CGFloat = 50.0) {
        self.imageView = imageView
        self.animationDuration = animationDuration
        self.moveDistance = moveDistance
    }

    func startAnimating() {
        UIView.animate(withDuration: animationDuration, animations: {
            // Move the image view up
            self.imageView.transform = CGAffineTransform(translationX: 0, y: -self.moveDistance)
        }) { _ in
            UIView.animate(withDuration: self.animationDuration, animations: {
                // Move the image view back to its original position
                self.imageView.transform = .identity
            }) { _ in
                // Recursive call to continue the animation
                self.startAnimating()
            }
        }
    }

    func stopAnimating() {
        // Stop the animation if needed
        imageView.layer.removeAllAnimations()
    }
}
