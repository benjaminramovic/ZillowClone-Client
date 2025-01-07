//
//  Estate.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 7.1.25..
//

import Foundation
struct Estate:Identifiable,Hashable {
    let id = UUID()
    let price:String
    let bedrooms:Int
    let bathrooms:Int
    let area:Double
    let title:String
    let address:String
}
