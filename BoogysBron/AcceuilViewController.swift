//
//  AcceuilViewController.swift
//  BoogysBron
//
//  Created by Jeremy viviand on 22/03/2021.
//

import UIKit
import Lottie

class AcceuilViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationBoogys()
    }
    func animationBoogys() {
        let animationView = AnimationView(name: "Animation")
        animationView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 400)
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
        animationView.play()
    }
}
