//
//  ErrandData.swift
//  The Errand App
//
//  Created by Gideon Bedzrah on 15/02/2021.
//

import Foundation

struct ErrandData {
    
    static let listOfErrands: [ListofErrands] = [
        ListofErrands(name: "Gardening", image: "hiker-man-colour-1200px", description: "The Errand Co. provides you with a reliable gardener to groom your plants.", detailErrands: Gardening.details),
                                                 
        ListofErrands(name: "Delivery", image: "CustomT", description: "The Errand Co. provides you with a reliable gardener to groom your plants.", detailErrands: detailErrand),
        
        ListofErrands(name: "Shopping", image: "shopping-cart-colour1200px", description: "The Errand Co. provides you with a reliable gardener to groom your plants.", detailErrands: detailErrand),
        
        ListofErrands(name: "Home Services", image: "storefront-colour-1200px", description: "The Errand Co. provides you with a reliable gardener to groom your plants.", detailErrands: detailErrand),
        
        ListofErrands(name: "Clothings", image: "fashion-tshirts-colour-1200px", description: "The Errand Co. provides you with a reliable gardener to groom your plants.", detailErrands: detailErrand),
        
        ListofErrands(name: "Other", image: "breakfast-colour-1200px", description: "The Errand Co. provides you with a reliable gardener to groom your plants.", detailErrands: detailErrand)]
    
    static let detailErrand: [DetailErrands] = [
        DetailErrands(title: "Full House Gardening", subtitle: "Trim and maintain your entire household's         plants, flowers, hedges and gardens. For houses well over 3 aches.", recommendedTime: "Recommended Time: 4+ hrs", amount: 90, image: "hiker-man-colour-1200px"),
        
        DetailErrands(title: "Full House Gardening", subtitle: "Trim and maintain your entire household's plants, flowers, hedges and gardens. For houses well over 3 aches.", recommendedTime: "Recommended Time: 4+ hrs", amount: 90, image: "hiker-man-colour-1200px"),
        
        DetailErrands(title: "Full House Gardening", subtitle: "Trim and maintain your entire household's plants, flowers, hedges and gardens. For houses well over 3 aches.", recommendedTime: "Recommended Time: 4+ hrs", amount: 90, image: "hiker-man-colour-1200px"),
        
        DetailErrands(title: "Full House Gardening", subtitle: "Trim and maintain your entire household's plants, flowers, hedges and gardens. For houses well over 3 aches.", recommendedTime: "Recommended Time: 4+ hrs", amount: 90, image: "hiker-man-colour-1200px"),
        
        DetailErrands(title: "Full House Gardening", subtitle: "Trim and maintain your entire household's plants, flowers, hedges and gardens. For houses well over 3 aches.", recommendedTime: "Recommended Time: 4+ hrs", amount: 90, image: "hiker-man-colour-1200px"),
        
    ]
}
