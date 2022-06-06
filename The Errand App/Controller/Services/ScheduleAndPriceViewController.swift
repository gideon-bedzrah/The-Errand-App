//
//  ScheduleAndPriceViewController.swift
//  The Errand App
//
//  Created by Gideon Bedzrah on 09/02/2021.
//

import UIKit

class ScheduleAndPriceViewController: UIViewController {
    
    @IBOutlet weak var totalHoursLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var totalAmountLabel: UILabel!

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var homeAddressLabel: UILabel!
    @IBOutlet weak var homeCheckbox: UIButton!
    
    @IBOutlet weak var workAddressLabel: UILabel!
    @IBOutlet weak var workCheckbox: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    let pricePerHour: Int = 90
    var details: DetailErrands?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.minimumDate = Date(timeIntervalSinceNow: Date().timeIntervalSinceNow)
        slider.minimumValue = 1
        slider.maximumValue = 6
        totalHoursLabel.text = String(Int(slider.value))
        
        homeCheckbox.setImage(UIImage(systemName: "square.fill"), for: .normal)
        homeCheckbox.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        
        workCheckbox.setImage(UIImage(systemName: "square.fill"), for: .normal)
        workCheckbox.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        
        if let d = details {
            backButton.setTitle(d.title, for: .normal)
        }
    }
    
    @IBAction func backbuttontapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func hoursRequested(_ sender: UISlider) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        let roundedValue = Int(sender.value)
        totalHoursLabel.text = String(roundedValue)
    
        if roundedValue == 1{
            generator.impactOccurred()
        }
        
        
        let price = roundedValue * pricePerHour
        
        totalAmountLabel.text = "GH¢ \(price)"
        
//        totalHoursLabel.addObserver(<#T##observer: NSObject##NSObject#>, forKeyPath: <#T##String#>, options: <#T##NSKeyValueObservingOptions#>, context: <#T##UnsafeMutableRawPointer?#>)
    }
    
    
    
    @IBAction func optionsTapped(_ sender: UIButton) {
        let generator = UIImpactFeedbackGenerator()
        generator.impactOccurred()
    }
    
    @IBAction func datePickerDidChange(_ sender: UIDatePicker) {
      
    }
    
    @IBAction func chooseFromMapTapped(_ sender: UIButton) {
    }
    
    @IBAction func addressCheckboxTapped(_ sender: UIButton) {
//        sender.isSelected = !sender.isSelected
        
        if sender == homeCheckbox {
            homeSelection()
        }else {
            workSelection()
        }
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
    }
    
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Make request to Paystack", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (_) in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func homeSelection() {
        homeCheckbox.isSelected = true
        workCheckbox.isSelected = false
        homeCheckbox.tintColor = UIColor(named: "AccentColor")
        workCheckbox.tintColor = .quaternaryLabel
    }
     
    func workSelection() {
        homeCheckbox.isSelected = false
        workCheckbox.isSelected = true
        workCheckbox.tintColor = UIColor(named: "AccentColor")
        homeCheckbox.tintColor = .quaternaryLabel
    }
}

