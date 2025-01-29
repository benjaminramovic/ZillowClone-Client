import Foundation

struct EstateMain: Identifiable, Hashable, Codable {
    var id: Int
    var title: String
    var description: String
    var price: Double
    //var imageURLs: [String]
    /*var location: String
    var estateType: String
    var forSale: Bool
    var numberOfRooms: Int
    var squareFootage: Double*/
    var latitude: Double
    var longitude: Double
    //var visited:Bool
    /*var yearBuilt: Int
    var floor: Int?
    var heatingType: String
    var parkingSpaces: Int
    var hasGarage: Bool
    var hasGarden: Bool
    var isFurnished: Bool
    var isAvailable: Bool
    var viewCount: Int
    var ownerName: String
    var ownerContact: String*/
    //var createdAt: String // change to Date if you want to use Date type for parsing
    //var updatedAt: String // change to Date if you want to use Date type for parsing
    
    // Adding CodingKeys to handle the potential name differences when decoding from JSON

}
