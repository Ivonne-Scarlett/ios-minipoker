//
//  ViewController.swift
//  minipoker
//
//  Created by Juan de Dios Vargas on 13/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cantidadApuestaLabel: UILabel!
    
    @IBOutlet weak var carta1: UIImageView!
    @IBOutlet weak var carta2: UIImageView!
    @IBOutlet weak var carta3: UIImageView!
    @IBOutlet weak var carta4: UIImageView!
    @IBOutlet weak var carta5: UIImageView!
    

    
    var baraja = [
                UIImage(named: "trebol A"),
                UIImage(named: "picas A"),
                UIImage(named: "corazones A"),
                UIImage(named: "diamantes A"),
                UIImage(named: "trebol 2"),
                UIImage(named: "trebol 2"),
                UIImage(named: "picas 2"),
                UIImage(named: "corazones 2"),
                UIImage(named: "diamantes 2"),
                UIImage(named: "trebol 2"),
                UIImage(named: "trebol 2"),
                UIImage(named: "trebol J"),
                UIImage(named: "trebol K"),
                UIImage(named: "trebol 7"),
                UIImage(named: "trebol 8"),
                UIImage(named: "corazones 3"),
                UIImage(named: "corazones 4"),
                UIImage(named: "corazones 2"),
                UIImage(named: "corazones J"),
                UIImage(named: "corazones 3"),
                UIImage(named: "corazones 5"),
                UIImage(named: "corazones 6"),
                UIImage(named: "corazones 7"),
                UIImage(named: "trebol 8"),
                UIImage(named: "diamantes 8"),
                UIImage(named: "diamantes 2"),
                UIImage(named: "diamantes K"),
                UIImage(named: "diamantes 2"),
                UIImage(named: "diamantes 3"),
                UIImage(named: "diamantes 4"),
                UIImage(named: "diamantes 2"),
                UIImage(named: "diamantes K"),
                UIImage(named: "diamantes Q"),
                UIImage(named: "diamantes J"),
                UIImage(named: "picas 2"),
                UIImage(named: "picas 2"),
                UIImage(named: "picas J"),
                UIImage(named: "picas K"),
                UIImage(named: "picas Q"),
                UIImage(named: "picas 2"),
                UIImage(named: "picas 2"),
                UIImage(named: "picas 2"),
                UIImage(named: "corazones 2")
    ]
    var apuesta : Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


   
    @IBAction func jugarButton(_ sender: UIButton) {
        
        //Validar si ya aposto algo
        if apuesta == 0 {
            //Aun no apuesta
            let alerta = UIAlertController(title: "Atención", message: "Necesitas apostar para poder jugar", preferredStyle: .alert)
            apuesta = apuesta + apuesta
            cantidadApuestaLabel.text = "\(apuesta)"
            let botonOk = UIAlertAction(title: "aceptar", style: .default)
            alerta.addAction(botonOk)
            present(alerta, animated: true)
            
        }else {
            
            //carta1.image = UIImage(named: baraja[0])   -    otra forma de cambiar el valor de la variable con un arreglo
            //ya aposto
            let num1 = Int.random (in: 0..<baraja.count)
            let num2 = Int.random (in: 0..<baraja.count)
            let num3 = Int.random (in: 0..<baraja.count)
            let num4 = Int.random (in: 0..<baraja.count)
            let num5 = Int.random (in: 0..<baraja.count)
            
            carta1.image = baraja[num1]
            carta2.image = baraja[num2]
            carta3.image = baraja[num3]
            carta4.image = baraja[num4]
            carta5.image = baraja[num5]
            
            //validar cuando sale un as en la primer carta mostrar un mensaje de juego ganador
            if num1 == 0 || num1 == 1 || num1 == 2 || num1 == 3 {
                let alerta = UIAlertController(title: "Felicidades", message: "Ganaste $\(apuesta)", preferredStyle: .alert)
                apuesta = apuesta + apuesta
                cantidadApuestaLabel.text = "\(apuesta)"
                let botonOk = UIAlertAction(title: "aceptar", style: .default)
                alerta.addAction(botonOk)
                present(alerta, animated: true)
            }
            
            
        }
        
        

    }
    
    
    @IBAction func apostarButton(_ sender: UIButton) {
        //Navegar con segue
        performSegue(withIdentifier: "apostar", sender: self)
    }
    
    //Mandar información con segue (método complementario al performSegue)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "apostar"{
            //crear una instancia de viewControler Destino
            let objDestino = segue.destination as! ApuestaViewController
            objDestino.recibirApuesta = cantidadApuestaLabel.text
        }
    }
    
    
    @IBAction func recibirApuestaDeSegundaPantalla(segue: UIStoryboardSegue){
        //crear una variable segura (safe-unwrap) llamda recibir Apuesta
        if let recibirApuesta = segue.source as? ApuestaViewController {
            //mostrar la apuesta de la segunda pantalla en el label de esta pantalla
            cantidadApuestaLabel.text = "\(recibirApuesta.cantidad)"
            apuesta = recibirApuesta.cantidad
            
        }
    }
    
    
    
    
}

