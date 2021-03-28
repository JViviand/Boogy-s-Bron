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

class ContactViewController: UIViewController, CLLocationManagerDelegate, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var BoogysMap: MKMapView!
    @IBOutlet weak var messageText: UITextField!
    @IBOutlet weak var objetText: UITextField!
    @IBOutlet weak var telephoneBordure: UIButton!
    @IBOutlet weak var envoyerBordure: UIButton!
    
    
    let manager = CLLocationManager()
    let recipientsMail : String? = "Example@gmail.com"
    let subject : String? = "Example"
    let toolBar = UIToolbar()
    let boogys = PinLocation(title: "Boogy's", subtitle: nil, coordinate: CLLocationCoordinate2D(latitude: 45.720159, longitude: 4.915661))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        managerLocation()
        SetupMapDelegate()
        buttonDone()
        nouvelleBordure()
        nouvelleBordureMail()
    }
    
    // Mapkit
    
    func managerLocation() {
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        manager.requestLocation()
    }
    
    @IBAction func segmentedPressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: BoogysMap.mapType = .standard
        case 1: BoogysMap.mapType = .satellite
        default: return
        }
        
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways: print("Always")
        case .authorizedWhenInUse: print("When in use")
        case .denied: print("Denied")
        case .notDetermined: print("Not Determined")
        case .restricted: print("Restricted")
        default: print("Other")
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let first = locations.first {
            let coordinates = first.coordinate
            print("Nous avons des coordonnées => \(coordinates)")
            let center: CLLocationCoordinate2D = coordinates
            let delta = 0.01
            let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
            let region = MKCoordinateRegion(center: center, span: span)
            BoogysMap.setRegion(region, animated: true)
        }
    }
    func SetupMapDelegate() {
        BoogysMap.delegate = self
        let annotation = MKPointAnnotation()
        annotation.coordinate = boogys.coordinate
        annotation.title = boogys.title
        annotation.subtitle = boogys.subtitle
        BoogysMap.addAnnotation(annotation)
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        } else {
            let newAnnotation = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "ID")
            newAnnotation.markerTintColor = .systemBlue
            return newAnnotation
        }
    }
    struct PinLocation {
        var title: String
        var subtitle: String?
        var coordinate: CLLocationCoordinate2D
    }
    
    // action pour telephoner au boogys
    
    @IBAction func BoogysTelephone(_ sender: UIButton) {
        let url:NSURL = URL(string: "TEL://0123456789")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    func nouvelleBordure(){
        telephoneBordure.layer.cornerRadius = 25
        telephoneBordure.layer.shadowRadius = 15
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
    func nouvelleBordureMail(){
        envoyerBordure.layer.cornerRadius = 25
        envoyerBordure.layer.shadowRadius = 15
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
    

