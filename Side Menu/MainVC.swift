//
//  MainVC.swift
//  SideMenu
//
//  Created by Usuario invitado on 11/29/18.
//  Copyright © 2018 com/Tricky. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class MainVC: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate {
    
    @IBOutlet weak var baños: MKMapView!
        private let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showProfile),
                                               name: NSNotification.Name("ShowProfile"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showSettings),
                                               name: NSNotification.Name("ShowSettings"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showSignIn),
                                               name: NSNotification.Name("ShowSignIn"),
                                               object: nil)
   //Mapkit Stuff//
        super.viewDidLoad()
        self.baños.delegate = self
       //Localizaciòn del usuario y autorizacioòn para usarla//
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        
        
        locationManager.startUpdatingLocation()
        self.baños.showsUserLocation = true
        
////////////////////////////Ubicaciones de Cada Baño/////////////////////////////////////////
   
///////////////////////////CustomAnnotationsBañosH/M////////////////////////////////////////////////
        //ANEXO FACULTAD DE INGENIERIA//
        let bañosPAFI = customPin(pinTitle:"Baños H/M", pinSubtitle:"Baños Anexo FI Sobre el pasillo bajo al edificio I", location: (CLLocationCoordinate2D(latitude: 19.326560, longitude: -99.182464)))
        self.baños.addAnnotation(bañosPAFI)
        let BañosAFIH1 = customPin(pinTitle: "Baños H", pinSubtitle: "3er Piso Edificio Y. Frente a Biblioteca", location: CLLocationCoordinate2D(latitude: 19.3255129, longitude: -99.1831058))
        self.baños.addAnnotation(BañosAFIH1)
        let BañosAFIH2 = customPin(pinTitle: "Baños H", pinSubtitle: "1er Piso Edificio J. Frente a Taller Robòtica", location: CLLocationCoordinate2D(latitude: 19.3267553, longitude: -99.1832329))
         self.baños.addAnnotation(BañosAFIH2)
        let BañosAFIH3 = customPin(pinTitle: "Baños H", pinSubtitle: "3er Piso Edificio J. Frente a Puente entre Edificio I y J", location: CLLocationCoordinate2D(latitude: 19.3262425, longitude: -99.1833080))
        self.baños.addAnnotation(BañosAFIH3)
        let BañosAFI2 = customPin(pinTitle: "Baños H/M", pinSubtitle: "Pasillo Planta Baja Edificio Posgrado", location: CLLocationCoordinate2D(latitude: 19.328413, longitude: -99.1816232))
        self.baños.addAnnotation(BañosAFI2)
        let BañosAFIM2y1 = customPin(pinTitle: "Baños M", pinSubtitle: "Bajo Baños H Edificio Y. 1er y 2do Piso", location:  CLLocationCoordinate2D(latitude: 19.3255129, longitude: -99.1831058))
        self.baños.addAnnotation(BañosAFIM2y1)
        let BañosAFIM3 = customPin(pinTitle: "Baños M", pinSubtitle: "Bajo Baños H. 2do Piso edificio J", location: CLLocationCoordinate2D(latitude: 19.3262425, longitude: -99.1833080))
        self.baños.addAnnotation(BañosAFIM3)
        let BañosAFI3 = customPin(pinTitle: "Baños H/M+", pinSubtitle: "Edificio Posgrado En Planta Baja, 1er y 2do Piso", location:  CLLocationCoordinate2D(latitude: 19.3278247, longitude: -99.1815287))
            self.baños.addAnnotation(BañosAFI3)
        
       //Facultad De Arquitectura//
        let BañoFACafe = customPin(pinTitle: "Baños H/M", pinSubtitle: "Cafeteria Diseño FA", location: CLLocationCoordinate2D(latitude:19.3311900,longitude: -99.1874681))
        self.baños.addAnnotation(BañoFACafe)
        let BañoFA1 = customPin(pinTitle: "Baños H", pinSubtitle: "1er Piso Edificio Principal.Frente a Taller Carlos Leduc", location: CLLocationCoordinate2D(latitude:19.331455,longitude:-99.186486))
        self.baños.addAnnotation(BañoFA1)
        let BañoFA2y3 = customPin(pinTitle: "Baños H/M+", pinSubtitle: "2do y 3er Piso. Escaleras A lado de servicios escolares", location: CLLocationCoordinate2D(latitude:19.3312416,longitude:-99.1864894))
        self.baños.addAnnotation(BañoFA2y3)
        
        //Biblioteca Central//
        let BañoBC1 = customPin(pinTitle: "Baños H/M", pinSubtitle: "A un costado de Servivios de Fotocopiado", location:  CLLocationCoordinate2D(latitude:19.3334328,longitude:-99.1874708))
        self.baños.addAnnotation(BañoBC1)
        let BañoBC2y3 = customPin(pinTitle: "Baños H/M+", pinSubtitle: "En nivel 1, 2 y 3. A ambos costados de las escaleras", location: CLLocationCoordinate2D(latitude: 19.3334799, longitude:-99.1873682))
        self.baños.addAnnotation(BañoBC2y3)
        //Facultad De Filosofìa y Letras//
        let BFFyL1 = customPin(pinTitle: "Baños H/M+", pinSubtitle: " 3er Piso,sobre Pasillo, frente al aula 311. 2do Piso frente a Aula 206A", location: CLLocationCoordinate2D(latitude: 19.333988, longitude:  -99.186445 ))
        self.baños.addAnnotation(BFFyL1)
        let BFFyL2 = customPin(pinTitle: "Baños H/M", pinSubtitle: "3er Piso, Pasando Audiovisuales Frente a Aula 312", location: CLLocationCoordinate2D(latitude: 19.3340538, longitude: -99.1859721))
        self.baños.addAnnotation(BFFyL2)
        let BFFyLM1 = customPin(pinTitle: "Baños M", pinSubtitle: "2do Piso. Esquina Frente a Servicios Escolares", location: CLLocationCoordinate2D(latitude: 19.3339899, longitude: -99.1867362))
        self.baños.addAnnotation(BFFyLM1)
        let ​BFFyL4 = customPin(pinTitle: "Baños H/M", pinSubtitle: " 1er Piso,Pasillo a la zona de teatro, Primera Esquina de lado izquierdo", location: CLLocationCoordinate2D(latitude: 19.334249, longitude:  -99.1867530))
        self.baños.addAnnotation(​BFFyL4)
        let BFFyL5 = customPin(pinTitle: "Baños H/M", pinSubtitle: "Planta baja,Pasillo frente a Cafetería Comité cerezo", location: CLLocationCoordinate2D(latitude: 19.334257, longitude: -99.1868281 ))
        self.baños.addAnnotation(BFFyL5)
        let  BFFyL6 = customPin(pinTitle: "Baños H/M", pinSubtitle: "Planta baja,a un lado del Salón de Actos 1)", location: CLLocationCoordinate2D(latitude: 19.33422914, longitude: -99.1862544))
        self.baños.addAnnotation(BFFyL6)
        //Facultad De Derecho//
        let BFDH1 = customPin(pinTitle: "Baños H", pinSubtitle: "Auditorio Benito Juárez,Costado Izq. entrada a librería)", location: CLLocationCoordinate2D(latitude: 19.3345692, longitude: -99.1858105))
        self.baños.addAnnotation(BFDH1)
        let BFDM1 = customPin(pinTitle: "Baños M", pinSubtitle: "Auditorio Benito Juàrez,esquina contraria Baño H", location: CLLocationCoordinate2D(latitude: 19.3345995, longitude: -99.1858269))
        self.baños.addAnnotation(BFDM1)
        let BFDM2 = customPin(pinTitle: "Baños M", pinSubtitle: "1er Piso Pasillo a costado derecho de librerìa Porrua,", location: CLLocationCoordinate2D(latitude: 19.3344012, longitude: -99.1856965 ))
        self.baños.addAnnotation(BFDM2)
        let BFDH2 = customPin(pinTitle: "Baños H", pinSubtitle: "2do Piso,Arriba de Baño M", location: CLLocationCoordinate2D(latitude: 19.3344012, longitude: -99.1856965 ))
        self.baños.addAnnotation(BFDH2)
        let BFDM3 = customPin(pinTitle: "Baños M", pinSubtitle: "2do Piso. A lado del aula D-101", location: CLLocationCoordinate2D(latitude: 19.3341465, longitude: -99.1849441 ))
        self.baños.addAnnotation(BFDM3)
        let BFDM4 = customPin(pinTitle: "Baños M", pinSubtitle: "2do Piso, a lado del aula D-112", location: CLLocationCoordinate2D(latitude: 19.3340886, longitude: -99.1859392))
        self.baños.addAnnotation(BFDM4)
        //Facultad De Ciencias//
        let BFCM1 = customPin(pinTitle: "Baños M", pinSubtitle: "Frente a busto de Albert Einstein", location: CLLocationCoordinate2D(latitude: 19.324875, longitude: -99.1805986))
        self.baños.addAnnotation(BFCM1)
        let BFCH1 = customPin(pinTitle: "Baños H", pinSubtitle:"2do Piso,Edificio O,Frente a Busto Albert Einstein", location: CLLocationCoordinate2D(latitude: 19.3247754, longitude: -99.1806472))
        self.baños.addAnnotation(BFCH1)
        let BFC1 = customPin(pinTitle: "Baños H/M", pinSubtitle: "Entre Edificios A y B de Biologìa, 2do Piso", location:  CLLocationCoordinate2D(latitude: 19.3241642, longitude: -99.1801296))
        self.baños.addAnnotation(BFC1)
        let BFC3y4y5y6y7 = customPin(pinTitle: "Baños H/M+", pinSubtitle: "Torre Escaleras Entre Edificios Fìsica,PB a 5to piso", location: CLLocationCoordinate2D(latitude: 19.3247972, longitude: -99.1801624))
        self.baños.addAnnotation(BFC3y4y5y6y7)
        let BFC8 = customPin(pinTitle: "Baños H/M", pinSubtitle: "1er Piso,Biblioteca Amoxcalli.Detras Estatua Prometeo", location: CLLocationCoordinate2D(latitude: 19.3249244, longitude: -99.1790004))
        self.baños.addAnnotation(BFC8)
        let BFCH2 = customPin(pinTitle: "Baños H", pinSubtitle: "Entre Sòtano y PB,Edificio Tlahuizcalpan", location: CLLocationCoordinate2D(latitude: 19.3237180, longitude: -99.1788834))
        self.baños.addAnnotation(BFCH2)
        let BFCD = customPin(pinTitle: "Baños H/M D", pinSubtitle: "Sòtano,Edificio Tlahuizcacalpan,Contaria aElevadores", location: CLLocationCoordinate2D(latitude: 19.3239060, longitude: -99.1791090))
        self.baños.addAnnotation(BFCD)
        let BFCH3 = customPin(pinTitle: "Baños H", pinSubtitle: "Escaleras entre PB y 1er Piso.Arriba de Baños M", location: CLLocationCoordinate2D(latitude: 19.3239300, longitude: -99.1791090))
        self.baños.addAnnotation(BFCH3)
        let BFCM2 = customPin(pinTitle: "Baños M", pinSubtitle: "Escaleras entre S y PB, Abajo de Baños H", location: CLLocationCoordinate2D(latitude: 19.3239300, longitude: -99.1791090))
        self.baños.addAnnotation(BFCM2)
        let BFCM3 = customPin(pinTitle: "Baños M", pinSubtitle: "1er Piso, a un costado del Taller de Finanzas", location: CLLocationCoordinate2D(latitude: 19.3236317, longitude: -99.1789343))
        self.baños.addAnnotation(BFCM3)
        let BFCM4 = customPin(pinTitle: "Baños M", pinSubtitle: "Escaleras Entre Pb y 1er Piso", location: CLLocationCoordinate2D(latitude: 19.3236317, longitude: -99.1789564))
        self.baños.addAnnotation(BFCM4)
        let BFCM5 = customPin(pinTitle: "Baños M", pinSubtitle: "1er Piso,A un lado de Casilleros", location: CLLocationCoordinate2D(latitude: 19.3238870, longitude: -99.179110))
        self.baños.addAnnotation(BFCM5)
        let BFCH4 = customPin(pinTitle: "Baños H", pinSubtitle: "Escaleras entre 1er y 2do Piso", location: CLLocationCoordinate2D(latitude: 19.3239439, longitude: -99.1791107))
        self.baños.addAnnotation(BFCH4)
        let BFCH5 = customPin(pinTitle: "Baños H", pinSubtitle: "Escaleras entre 1er y 2do Piso.Arriba de Baños M", location: CLLocationCoordinate2D(latitude: 19.3235972, longitude: -99.1788284))
        self.baños.addAnnotation(BFCH5)
        let BFCH6 = customPin(pinTitle: "Baños H", pinSubtitle: "2do Piso, a lado de Salòn de Tècnicos Acadèmicos", location: CLLocationCoordinate2D(latitude: 19.3236048, longitude: -99.178666))
        self.baños.addAnnotation(BFCH6)
        let BFCM7 = customPin(pinTitle: "Baños M", pinSubtitle: "Entre PB y 1er piso,Edifico B Frente a Busto de Darwin", location: CLLocationCoordinate2D(latitude: 19.3237952, longitude: -99.1795640))
        self.baños.addAnnotation(BFCM7)
        let BFCM8 = customPin(pinTitle: "Baños M", pinSubtitle: "Primer piso, En el Pasillo conectado a Tlahuizcalpan", location: CLLocationCoordinate2D(latitude: 19.3232070, longitude: -99.1794701))
        self.baños.addAnnotation(BFCM8)
        let BFCH7 = customPin(pinTitle: "Baños H", pinSubtitle: "Ecaleras entre 1er y 2do Piso, Arriba de Baños M,", location: CLLocationCoordinate2D(latitude: 19.3237952, longitude: -99.1795640))
        self.baños.addAnnotation(BFCH7)
        
    }
///////////////////////////////CustomPinsBañosH/M///////////////////////////////////////////////////
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation)-> MKAnnotationView? {

            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
            
            if annotationView == nil{
                annotationView =  MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
            }
            if annotation.title == "Baños H/M"{
                annotationView?.image = UIImage(named: "iBañosH:M")
            }
            else if annotation.title == "Baños H"{
                annotationView?.image = UIImage(named: "iBañosH")
            }
            else if annotation.title == "Baños M"{
                annotationView?.image = UIImage(named: "iBañosM")
            }
            else if annotation.title == "Baños H/M+"{
                annotationView?.image = UIImage(named: "iBañosH:M+")
            }
            else if annotation.title == "Baños H/M D"{
                annotationView?.image = UIImage(named: "iWheelChair")
            }
            else if annotation === mapView.userLocation{
                annotationView?.image = UIImage(named: "iRunningM")
                
            }
            /*let bañosPAFIHM = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
            bañosPAFIHM.image = UIImage(named: "iBañosH:M")
            bañosPAFIHM.canShowCallout = true
                return bañosPAFIHM */
            annotationView?.canShowCallout = true
            return annotationView
    }
  
////////////////////////////CustomPinsBañosH////////////////////////////////////////////
            
            
           
        
    
    

    
    
    
//////////////////////////Actualizacion de Ubicaciòn de usuario/////////////////////////////
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
        
        mapView.setRegion(region, animated: true)
    }
    
    
//////////////////////////Funciones Del SideMenu con Objective-C////////////////////////////
    @objc func showProfile() {
        performSegue(withIdentifier: "ShowProfile", sender: nil)
    }
    
    @objc func showSettings() {
        performSegue(withIdentifier: "ShowSettings", sender: nil)
    }
    
    @objc func showSignIn() {
        performSegue(withIdentifier: "ShowSignIn", sender: nil)
    }
    
///////////////////////////////////////Instrucciones en bajo nivel///////////////////////////
    @IBAction func onMoreTapped() {
        print("Wacha Carnal, un menù. Que bonito.")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
             }
    
    

///////////////////////////////////////////MapChange/////////////////////////////////////////
@IBAction func mapTypeChanged(_ sender: UISegmentedControl) {
    // TODO
    baños.mapType = MKMapType.init(rawValue: UInt(sender.selectedSegmentIndex)) ?? .standard
    }
    
}





