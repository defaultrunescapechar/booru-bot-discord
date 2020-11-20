struct Bot: Decodable {
    enum CodingKeys: String, CodingKey {
        case token
        case status
        case prefix
        case defaultQuery

    }
    let token: String
    let status: String
    let prefix: String
    let defaultQuery: String

    
}