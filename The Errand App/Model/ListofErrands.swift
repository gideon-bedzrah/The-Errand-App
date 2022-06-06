//
//  ListofErrands.swift
//  The Errand App
//
//  Created by Gideon Bedzrah on 15/02/2021.
//

import Foundation

struct ListofErrands {
    let name: String
    let image: String
    let description: String
    let detailErrands: [DetailErrands]
}

struct DetailErrands {
    let title: String
    let subtitle: String
    let recommendedTime: String
    let amount: Int
    let image: String
}

struct ListofShops {
    let name: String
    let locations: String
    let itemTypes: String
    let operatingTime: String
}
