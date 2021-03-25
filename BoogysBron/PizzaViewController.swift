//
//  PizzaViewController.swift
//  BoogysBron
//
//  Created by Jeremy viviand on 22/03/2021.
//

import UIKit

class PizzaViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollPizza: UIScrollView!
    @IBOutlet weak var jeudiFirst: UILabel!
    @IBOutlet weak var jeudiSecond: UILabel!
    @IBOutlet weak var pizzaClassique: UIStackView!
    @IBOutlet weak var pizzaSignature: UIStackView!
    @IBOutlet weak var listeFirst: UIStackView!
    @IBOutlet weak var listeCenter: UIStackView!
    @IBOutlet weak var listeLast: UIStackView!
    @IBOutlet weak var prixPizza: UILabel!
    @IBOutlet weak var formulePizza: UILabel!
    @IBOutlet weak var telephone: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollPizza.delegate = self
        jeudiFirstView()
        jeudiSecondView()
        pizzaClassiqueView()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("frame \(scrollView.layer.frame)")
        print("bounds \(scrollView.layer.bounds)")
    }
    func jeudiFirstView() {
        jeudiFirst.layer.cornerRadius = 20
        jeudiFirst.layer.shadowRadius = 10
        jeudiFirst.layer.shadowOpacity = 1.0
        jeudiFirst.layer.shadowOffset = CGSize(width: 3, height: 3)
        jeudiFirst.layer.shadowColor = UIColor.black.cgColor
    }
    func jeudiSecondView() {
        jeudiSecond.layer.cornerRadius = 20
        jeudiSecond.layer.shadowRadius = 10
        jeudiSecond.layer.shadowOpacity = 1.0
        jeudiSecond.layer.shadowOffset = CGSize(width: 3, height: 3)
        jeudiSecond.layer.shadowColor = UIColor.black.cgColor
    }
    func pizzaClassiqueView() {
        pizzaClassique.layer.cornerRadius = 20
        pizzaClassique.layer.shadowRadius = 10
        pizzaClassique.layer.shadowOpacity = 1.0
        pizzaClassique.layer.shadowOffset = CGSize(width: 3, height: 3)
        pizzaClassique.layer.shadowColor = UIColor.black.cgColor
    }
    func pizzaSignatureView() {
        pizzaSignature.layer.cornerRadius = 20
        pizzaSignature.layer.shadowRadius = 10
        pizzaSignature.layer.shadowOpacity = 1.0
        pizzaSignature.layer.shadowOffset = CGSize(width: 3, height: 3)
        pizzaSignature.layer.shadowColor = UIColor.black.cgColor
    }
    func listeFirstView() {
        listeFirst.layer.cornerRadius = 20
        listeFirst.layer.shadowRadius = 10
        listeFirst.layer.shadowOpacity = 1.0
        listeFirst.layer.shadowOffset = CGSize(width: 3, height: 3)
        listeFirst.layer.shadowColor = UIColor.black.cgColor
    }
    func listeCenterView() {
        listeCenter.layer.cornerRadius = 20
        listeCenter.layer.shadowRadius = 10
        listeCenter.layer.shadowOpacity = 1.0
        listeCenter.layer.shadowOffset = CGSize(width: 3, height: 3)
        listeCenter.layer.shadowColor = UIColor.black.cgColor
    }
    func listeLastView() {
        listeLast.layer.cornerRadius = 20
        listeLast.layer.shadowRadius = 10
        listeLast.layer.shadowOpacity = 1.0
        listeLast.layer.shadowOffset = CGSize(width: 3, height: 3)
        listeLast.layer.shadowColor = UIColor.black.cgColor
    }
    func prixPizzaView() {
        prixPizza.layer.cornerRadius = 20
        prixPizza.layer.shadowRadius = 10
        prixPizza.layer.shadowOpacity = 1.0
        prixPizza.layer.shadowOffset = CGSize(width: 3, height: 3)
        prixPizza.layer.shadowColor = UIColor.black.cgColor
    }
    func formulePizzaView() {
        formulePizza.layer.cornerRadius = 20
        formulePizza.layer.shadowRadius = 10
        formulePizza.layer.shadowOpacity = 1.0
        formulePizza.layer.shadowOffset = CGSize(width: 3, height: 3)
        formulePizza.layer.shadowColor = UIColor.black.cgColor
    }
    
}

