//
//  TaskDetailViewController.swift
//  The Errand App
//
//  Created by Gideon Bedzrah on 18/02/2021.
//

import UIKit

class TaskDetailViewController: UIViewController {

    @IBOutlet weak var errandDate: UILabel!
    @IBOutlet weak var errandCategory: UILabel!
    @IBOutlet weak var errandSubCategory: UILabel!
    @IBOutlet weak var errandAmount: UILabel!
    @IBOutlet weak var errandDuration: UILabel!
    @IBOutlet weak var errandLocation: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}
extension TaskDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath)
    }
    
    
}
