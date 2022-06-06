//
//  ViewController.swift
//  The Errand App
//
//  Created by Gideon Bedzrah on 08/02/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var closeNotButton: UIButton!
    @IBOutlet weak var headingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    let listOfErrands = ErrandData.listOfErrands
    
//    let listOfErrands = ["Gardening", "Delivery", "Shopping", "Home Services", "Clothings", "Other"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let navigation = navigationController?.navigationBar else {return}
        navigation.isHidden = true
    }
    
    @IBAction func closeNotification(_ sender: UIButton) {
        notificationClose()
    }

    func notificationClose() {
//        headingView.translatesAutoresizingMaskIntoConstraints = false
        notificationView.translatesAutoresizingMaskIntoConstraints = true
        notificationView.bounds = CGRect(x: 0, y: 0, width: 414, height: 0)
        closeNotButton.isHidden = true
        notificationLabel.isHidden = true; 
//        collectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfErrands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ErrandCell", for: indexPath) as! ErrandCollectionViewCell
        cell.label.text = listOfErrands[indexPath.row].name
        cell.image.image = UIImage(named: listOfErrands[indexPath.row].image)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        return CGSize(width: bounds.width / 2 - 10, height: (bounds.width / 2 - 30) + 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SearchBarHeader", for: indexPath)
        
        return sectionHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if listOfErrands[indexPath.row].name == "Shopping" {
            performSegue(withIdentifier: "toShoppingDetail", sender: self)
        } else if listOfErrands[indexPath.row].name == "Delivery" {
            performSegue(withIdentifier: "toDeliveryMap", sender: self)
        } else {
            performSegue(withIdentifier: "toErrandDetails", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = collectionView.indexPathsForSelectedItems?[0]
        if segue.identifier == "toErrandDetails" {
            let destinationVC = segue.destination as! DetailListViewController
            destinationVC.errand = listOfErrands[indexPath!.row]
        }
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
}
