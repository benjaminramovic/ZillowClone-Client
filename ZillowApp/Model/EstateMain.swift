import Foundation

struct EstateMain: Identifiable, Hashable, Codable {
       let id: Int
       let title: String
       var description: String
       let price: Double
       let location: String
       let estateType: String
       let forSale: Bool
       let numberOfRooms: Int
       let squareFootage: Double
       let latitude: Double
       let longitude: Double
       let yearBuilt: Int
       let floor: Int?
       let heatingType: String
       let parkingSpaces: Int
       let hasGarage: Bool
       let hasGarden: Bool
       let place: String
       let imageURLs: [String]
       let ownerName: String
       let ownerContact: String
       let viewCount: Int
       let days: Int
       let numSaved: Int
       let isFurnished: Bool?
       let isAvailable: Bool?

}
