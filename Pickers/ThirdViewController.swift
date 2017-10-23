//
//  ThirdViewController.swift
//  Pickers
//
//  Created by vdab cursist on 19/10/2017.
//  Copyright © 2017 Training. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var myDependantPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myBundle = Bundle.main
        let plistPath = myBundle.path (forResource: "shows-characters" , ofType: "plist")
        showsCharacters = NSDictionary(contentsOfFile: plistPath!)
        let allKeys = showsCharacters.allKeys as! [String]
        shows = allKeys.sorted()
        let selectedShows : String = shows[0]
        characters = showsCharacters[selectedShows] as! [String]
        characters = characters.sorted()
        
        // Do any additional setup after loading the view.
    }
    
    let kShowsComponent = 0
    let kCharactersComponent = 1
    
    var showsCharacters : NSDictionary!
    var shows : [String]!
    var characters : [String]!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == kShowsComponent
        {
            return shows.count
        }
        return characters.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
    
    if component == kShowsComponent
    {
        return shows [row]
        }
        return characters [row]
        
        }
        
        func pickerView(_pickerView: UIPickerView , didSelectRow row: Int, inComponent component: Int) {
            if component == kShowsComponent
  
        {
            let selectedShow = shows[row]
            characters = showsCharacters[selectedShow] as! [String]
            characters = characters.sorted()
            myDependantPicker.reloadComponent(kCharactersComponent)
            myDependantPicker.selectRow(0, inComponent: kCharactersComponent, animated: true)
        }
           
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



