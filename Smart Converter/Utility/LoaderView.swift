//
//  LoaderView.swift
//  Smart Converter
//
//  Created by Sowjanya on 28/12/24.
//

import UIKit
import Lottie

class LoaderView: UIView {
    private let animationView = LottieAnimationView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.layer.cornerRadius = 10

        // Set up the Lottie animation
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animation = LottieAnimation.named("circle") // Use your animation file name

        self.addSubview(animationView)

        // Center the animation within the view
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 200),
            animationView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    func show(in view: UIView) {
        self.frame = view.bounds
        view.addSubview(self)
        animationView.play()
    }

    func dismiss() {
        animationView.stop()
        self.removeFromSuperview()
    }
}
