//
//  FirstViewController.swift
//  Pickers
//
//  Created by vdab cursist on 19/10/2017.
//  Copyright © 2017 Training. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    
    var pickerData : [String]!
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let character = pickerData[row]
        let fullImageName = character + ".jpg"
        myImageView.image = UIImage (named: fullImageName)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerData = ["Luke", "Leia", "Han", "Chewbacca", "Artoo", "C3P0", "Yoda"]
        myImageView.image = UIImage (named: "Luke.jpg")
        
    }
    @IBOutlet weak var myImageView: UIImageView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData [row]
    }
    }


