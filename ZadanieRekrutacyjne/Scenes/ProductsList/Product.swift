import Foundation

struct Product: Decodable {
    let id: UUID
    let name: String
    let price: Float
    let description: String
    let imageUrl: URL

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case description
        case imageUrl = "image_url"
    }
}
