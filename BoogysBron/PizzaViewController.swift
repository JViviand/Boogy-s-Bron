//
//  PizzaViewController.swift
//  BoogysBron
//
//  Created by Jeremy viviand on 22/03/2021.
//

import UIKit

class PizzaViewController: UIViewController, UIScrollViewDelegate {
    
    // image depart
    @IBOutlet weak var ImagePizza: UIImageView!
    // bordure et fond noir
    @IBOutlet weak var pizzaClassique: UIStackView!
    @IBOutlet weak var pizzaSignature: UIStackView!
    @IBOutlet weak var supplements: UIStackView!
    @IBOutlet weak var prix: UIStackView!
    @IBOutlet weak var formules: UIStackView!
    @IBOutlet weak var telephone: UIButton!

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pizzaClassiqueView()
        pizzaSignatureView()
        supplementsPizzaView()
        prixPizzaView()
        formulePizzaView()
    }
    
    func pizzaClassiqueView() {
        pizzaClassique.layer.cornerRadius = 50
        pizzaClassique.layer.shadowRadius = 25
        pizzaClassique.layer.borderWidth = 1
        pizzaClassique.layer.borderColor = UIColor.black.cgColor
    }
    func pizzaSignatureView() {
        pizzaSignature.layer.cornerRadius = 50
        pizzaSignature.layer.shadowRadius = 25
        pizzaSignature.layer.borderWidth = 1
        pizzaSignature.layer.borderColor = UIColor.black.cgColor
    }
    func supplementsPizzaView() {
        supplements.layer.cornerRadius = 25
        supplements.layer.shadowRadius = 15
        supplements.layer.borderWidth = 1
        supplements.layer.borderColor = UIColor.black.cgColor
    }
    func prixPizzaView() {
        prix.layer.cornerRadius = 25
        prix.layer.shadowRadius = 15
        prix.layer.borderWidth = 1
        prix.layer.borderColor = UIColor.black.cgColor
    }
    func formulePizzaView() {
        formules.layer.cornerRadius = 25
        formules.layer.shadowRadius = 15
        formules.layer.borderWidth = 1
        formules.layer.borderColor = UIColor.black.cgColor
    }
    @IBAction func telephonePizza(_ sender: Any) {
        let url:NSURL = URL(string: "TEL://0123456789")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
}

