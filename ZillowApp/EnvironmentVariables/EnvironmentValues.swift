//
//  Location.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 26.1.25..
//

import Foundation
import SwiftUI

/*private struct LocationKey: EnvironmentKey {
    static let defaultValue: String = "Novi Pazar"
}

extension EnvironmentValues {
    var location: String {
        get { self[LocationKey.self] }
        set { self[LocationKey.self] = newValue }
    }
}

extension View {
    func setLocation(_ value: String) -> some View {
        environment(\.location, value)
    }
}*/
class LocationManager: ObservableObject {
    @Published var location: String = "Green Rd, Suburbia"
    @Published var visited:[Bool] = [false,false,false,false,false,false,false,false,false,false]
    @Published var userId:Int = 0;
}



