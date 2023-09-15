//
//  ArrowAnimation.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-15.
//

import UIKit

class ArrowAnimation {
    private let labels: [UILabel]
    private var isAnimating = false

    init(labels: [UILabel]) {
        self.labels = labels
    }

    func startAnimating() {
        guard !isAnimating else { return }

        isAnimating = true

        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [.autoreverse, .repeat], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                for label in self.labels {
                    label.transform = CGAffineTransform(translationX: 10, y: 0)
                }
            }

            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                for label in self.labels {
                    label.transform = CGAffineTransform(translationX: -10, y: 0)
                }
            }
        }, completion: nil)
    }

    func stopAnimating() {
        for label in labels {
            label.layer.removeAllAnimations()
            label.transform = .identity
        }
        isAnimating = false
    }
}
