import Foundation

struct Place: Hashable, Codable {
    let imageUrl: String
    let name: String
    let description: String
    let weatherUrl: String
}
