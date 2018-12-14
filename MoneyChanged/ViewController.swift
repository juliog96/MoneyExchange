//
//  ViewController.swift
//  MoneyChanged
//
//  Created by JulioG on 26/10/18.
//  Copyright © 2018 JulioG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var imageFlag: UIImageView!
    @IBOutlet weak var imageBack: UIImageView!
    @IBOutlet weak var lblMoney: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var lblConvert: UILabel!
    @IBOutlet weak var numConvert: UITextField!
    @IBOutlet weak var lblExchange: UILabel!
    @IBOutlet weak var imageAdmin: UIButton!
    
    var count: Int = 0

    @IBAction func btnPrev(_ sender: UIButton) {
        if (count > 0){
            count = count - 1
            imageBack.image = Datos[count]?.backimage
            imageFlag.image = Datos[count]?.flag
            lblMoney.text = Datos[count]?.name
            lblValue.text = String(format: "%.2f", (Datos[count]?.value)!) + "$"
        }
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        count = count + 1
        if count < Datos.count{
            imageBack.image = Datos[count]?.backimage
            imageFlag.image = Datos[count]?.flag
            lblMoney.text = Datos[count]?.name
            if(Datos[count]?.name == "Won"){
                lblValue.text = String(format: "%.5f", (Datos[count]?.value)!) + "$"
            }else{
                lblValue.text = String(format: "%.2f", (Datos[count]?.value)!) + "$"
            }
        }
        else{
            count = count - 1
        }
    }
    
    var first: money?
    var second: money?
    var num = 0.0;
    var numConverted: String = ""
    
    @IBAction func btnConvert(_ sender: UIButton) {
        numConverted = numConvert.text!
        let admin: Int? = Int(numConverted)
        if admin == 999{
            imageAdmin.isHidden = false
        }else{
            if(numConverted != ""){
        num = Double(numConverted)!
        num = (num * (first?.value)!)/(second?.value)!
        let show = String(format: "%.2f", num)
        lblConvert.isHidden = false;
        lblExchange.isHidden = false;
        switch second?.name {
        case "Dolar":
            lblExchange.text = "\(show)$"
            break
        case "Euro":
            lblExchange.text = "\(show)€"
            break
        case "Libra":
            lblExchange.text = "\(show)£"
            break
        case "Yuan":
            lblExchange.text = "\(show)¥"
            break
        case "Won":
            lblExchange.text = "\(show)₩"
            break
        default:
            print("...")
                }
            }
        }
    }

    var dolar: money?
    var euro: money?
    var libra: money?
    var yuan: money?
    var won: money?

    
    var Datos = [money?]()
    
    func numberOfComponents(in pickerview: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerview: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Datos.count
    }
    
    func pickerView(_ pickerview: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Datos[row]!.name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        first = Datos[pickerView.selectedRow(inComponent: 0)]!
        second = Datos[pickerView.selectedRow(inComponent: 1)]!
    
        lblConvert.text = "The conversion from \(first!.name) to \(second!.name)"
    }
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        if(Datos.count == 0){
        
        dolar = money(name: "Dolar", backimage: "fondo_usa.jpg", flag: "usa.png", value: 1)
        euro = money(name: "Euro", backimage: "fondo_bcn.jpg", flag: "spain.png", value: 1.14)
        libra = money(name: "Libra", backimage: "fondo_londres.jpg", flag: "uk.png", value: 1.31)
        yuan = money(name: "Yuan", backimage: "fondo_china.jpg", flag: "cn.png", value: 0.14)
        won = money(name: "Won", backimage: "fondo_seul.jpg", flag: "kr.png", value: 0.00089)
        
        Datos.append(contentsOf: [dolar, euro, libra, yuan, won])
        }
            
        imageBack.image = Datos[0]?.backimage
        imageFlag.image = Datos[0]?.flag
        lblMoney.text = Datos[0]?.name
        lblValue.text = String(format: "%.2f", (Datos[0]?.value)!) + "$"
        
        lblConvert.isHidden = true
        lblExchange.isHidden = true
        imageAdmin.isHidden = true
        
    }
    @IBAction func btnSend(_ sender: UIButton) {
        self.performSegue(withIdentifier: "LoadView", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoadView" {
            if let destination = segue.destination as? AdminController {
                destination.Datos2 = Datos
            }
        }
    }
    
}

