//
//  AdminController.swift
//  MoneyChanged
//
//  Created by JulioG on 4/11/18.
//  Copyright © 2018 JulioG. All rights reserved.
//

import UIKit

class AdminController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var Datos2 = [money?]()
    var select: money?
    var n = ""
    
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var ChangeTxt: UITextField!
    
    @IBAction func btnApply(_ sender: UIButton) {
        for element in Datos2{
            let newValue = ChangeTxt.text!
            if element?.name == select?.name{
                n = (select?.name)!
                lblInfo.text = "The new value of \(n) is \(newValue)"
                lblInfo.isHidden = false
                element?.value = Double(newValue)!
            }
        }
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Datos2.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Datos2[row]!.name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        select = Datos2[pickerView.selectedRow(inComponent: 0)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        lblInfo.isHidden = true
        
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.performSegue(withIdentifier: "BackView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BackView" {
            if let destination = segue.destination as? ViewController {
                destination.Datos = Datos2
            }
        }
    }
    
}

