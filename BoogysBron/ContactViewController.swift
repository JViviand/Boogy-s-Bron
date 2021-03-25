//
//  ContactViewController.swift
//  BoogysBron
//
//  Created by Jeremy viviand on 22/03/2021.
//

import UIKit
import MapKit
import CoreLocation
import MessageUI

class ContactViewController: UIViewController, CLLocationManagerDelegate, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var BoogysMap: MKMapView!
    @IBOutlet weak var messageText: UITextField!
    @IBOutlet weak var objetText: UITextField!
    
    let manager = CLLocationManager()
    let recipientsMail : String? = "Example@gmail.com"
    let subject : String? = "Example"
    let toolBar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        managerLocation()
        buttonDone()
    }
    
    // fonction pour l'authorisation de la location map
    
    func managerLocation() {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    // fonction pour mapkit
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        BoogysMap.setRegion(region, animated: true)
        self.BoogysMap.showsUserLocation = true
    }
    
    // action pour telephoner au boogys
    
    @IBAction func BoogysTelephone(_ sender: UIButton) {
        let url:NSURL = URL(string: "TEL://0123456789")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        sender.layer.cornerRadius = 20
    }
    
    // action pour envoyer un mail au boogys
    
    @IBAction func envoyer(_ sender: Any) {
        sendEmail()
    }
    @objc func sendEmail() {
        let mailComposeViewController = configureMailComposer()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self .showerrorMessage()
        }
    }
    
    func configureMailComposer() -> MFMailComposeViewController{
        let mc = MFMailComposeViewController()
        mc.mailComposeDelegate = self as MFMailComposeViewControllerDelegate
        mc.setToRecipients([self.recipientsMail!])
        mc.setSubject(objetText.text!)
        mc.setMessageBody("Message: \(messageText.text!)", isHTML: false)
        return mc
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            break
        case .saved:
            break
        case .sent:
            break
        case .failed:
            break
        default:
            break
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func showerrorMessage() {
        let alertMessage = UIAlertController(title: "Impossible d'envoyer l'E-Mail", message: "Verifier que l'application (Mail) de votre Iphone est bien configurer dans les réglages", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: nil)
        alertMessage.addAction(action)
        self.present(alertMessage, animated: true, completion: nil)
        
    }
    // ajouter l'option pour effacer ou valider le textfield
    
    func buttonDone() {
        toolBar.sizeToFit()
        let valideButton = UIBarButtonItem(title: "Validé", style: .plain, target: self, action: #selector(validebuttonpression))
        let espaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolBar.setItems([espaceButton,valideButton], animated: true)
        messageText.inputAccessoryView = toolBar
        objetText.inputAccessoryView = toolBar
    }
    
   @objc func validebuttonpression() {
        self.view.endEditing(true)
    }
    
    // action pour enlever le clavier apres ecriture
    
    @IBAction func dismisskeyboard(_ sender: AnyObject) {
        self.resignFirstResponder()
    }
}
    

