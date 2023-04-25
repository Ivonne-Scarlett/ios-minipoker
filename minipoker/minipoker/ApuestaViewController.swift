//
//  ApuestaViewController.swift
//  minipoker
//
//  Created by Ivonne on 20/04/23.
//

import UIKit

class ApuestaViewController: UIViewController {
    
    var recibirApuesta: String?
    var cantidad = 0.0
    
    @IBOutlet weak var cantidadApostar: UITextField!
    
    @IBOutlet weak var cantidadApustaLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(recibirApuesta!)
        cantidadApustaLabel.text = recibirApuesta

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func confirmarApuestaButton(_ sender: Any) {
        //Mostrar en el label la cantidad ingresada, e ir sumando
        //Validar que el usuario escriba una cantidad
        if cantidadApostar.text == "" {
            let alerta = UIAlertController(title: "Atención", message: "Necesitas ingresar una coantidad", preferredStyle: .alert)
            
            let aceptar = UIAlertAction(title: "Aceptar", style: .default)
            
            alerta.addAction(aceptar)
            present(alerta, animated: true)
        }else {
            //Extraer el texto de la cantidadApostarTextField (String)
            let nuevaApuesta = cantidadApostar.text
            //COnvertir double para poderlo sumar
            let apuestaDouble = Double(nuevaApuesta!) ?? 0.0
            //Hacer la suma con la cantidad que se esta recibiendo/mostrando
            cantidad = cantidad + apuestaDouble
            cantidadApustaLabel.text = "\(cantidad)"
            cantidadApostar.text = ""
            cantidadApostar.endEditing(true) //Ocultar el teclado
            
            
        }
        
    }
    
    @IBAction func jugarButton(_ sender: UIButton) {
        //Sevolver la cantidad
        
    }
    
    
}

