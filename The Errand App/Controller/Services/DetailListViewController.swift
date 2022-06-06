//
//  DetailListViewController.swift
//  The Errand App
//
//  Created by Gideon Bedzrah on 08/02/2021.
//

import UIKit

class DetailListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var categoryDescription: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    var details: [DetailErrands]!
    
    var errand: ListofErrands? {
        didSet{
            details = errand?.detailErrands
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if errand != nil {
            backButton.setTitle(errand!.name, for: .normal)
            categoryDescription.text = errand!.description
            categoryImage.image = UIImage(named: errand!.image)
        }
        
    }
    
    @IBAction func backbuttontapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension DetailListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "ErrandOptionsCell", for: indexPath) as! ErrandDetailCell
        
        let detailIndex = details[indexPath.row]
        cell.title.text = detailIndex.title
        cell.subTitle.text = detailIndex.subtitle
        cell.recommendedTime.text = detailIndex.recommendedTime
        cell.amount.text = "¢\(detailIndex.amount)/hr"
        cell.smallImage.image = UIImage(named: detailIndex.image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toDetailSelection", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailSelection" {
            let destinationVC = segue.destination as! ScheduleAndPriceViewController
//            destinationVC = 
        }
    }
}
