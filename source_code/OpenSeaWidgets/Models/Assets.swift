//
//  Characters.swift
//  RickMorty
//
//  Created by Oleksii Skliarenko on 03.07.2021.
//

import Foundation

// MARK: - Response
struct AssetsResponse: Codable {
    let assets: [Asset]
}

// MARK: - Asset
struct Asset: Codable {
    let id: Int
    let tokenID: String
    let numSales: Int
    let backgroundColor: JSONNull?
    let imageURL: String
    let imagePreviewURL, imageThumbnailURL: String?
    let imageOriginalURL, animationURL, animationOriginalURL: JSONNull?
    let name, assetDescription: String?
    let externalLink: String?
    let assetContract: AssetContract
    let permalink: String
    let collection: Collection
    let decimals, tokenMetadata: JSONNull?
    let owner: Creator
    let sellOrders: JSONNull?
    let creator: Creator
    let traits: [Trait]
    let lastSale, topBid, listingDate: JSONNull?
    let isPresale: Bool
    let transferFeePaymentToken, transferFee: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id
        case tokenID = "token_id"
        case numSales = "num_sales"
        case backgroundColor = "background_color"
        case imageURL = "image_url"
        case imagePreviewURL = "image_preview_url"
        case imageThumbnailURL = "image_thumbnail_url"
        case imageOriginalURL = "image_original_url"
        case animationURL = "animation_url"
        case animationOriginalURL = "animation_original_url"
        case name
        case assetDescription = "description"
        case externalLink = "external_link"
        case assetContract = "asset_contract"
        case permalink, collection, decimals
        case tokenMetadata = "token_metadata"
        case owner
        case sellOrders = "sell_orders"
        case creator, traits
        case lastSale = "last_sale"
        case topBid = "top_bid"
        case listingDate = "listing_date"
        case isPresale = "is_presale"
        case transferFeePaymentToken = "transfer_fee_payment_token"
        case transferFee = "transfer_fee"
    }
}

// MARK: - AssetContract
struct AssetContract: Codable {
    let address: Address
    let assetContractType: AssetContractType
    let createdDate: CreatedDate
    let name: Name
    let nftVersion: String?
    let openseaVersion: OpenseaVersion?
    let owner: Int
    let schemaName: SchemaName
    let symbol: Symbol
    let totalSupply: String?
    let assetContractDescription: String
    let externalLink, imageURL: String?
    let defaultToFiat: Bool
    let devBuyerFeeBasisPoints, devSellerFeeBasisPoints: Int
    let onlyProxiedTransfers: Bool
    let openseaBuyerFeeBasisPoints, openseaSellerFeeBasisPoints, buyerFeeBasisPoints, sellerFeeBasisPoints: Int
    let payoutAddress: String?

    enum CodingKeys: String, CodingKey {
        case address
        case assetContractType = "asset_contract_type"
        case createdDate = "created_date"
        case name
        case nftVersion = "nft_version"
        case openseaVersion = "opensea_version"
        case owner
        case schemaName = "schema_name"
        case symbol
        case totalSupply = "total_supply"
        case assetContractDescription = "description"
        case externalLink = "external_link"
        case imageURL = "image_url"
        case defaultToFiat = "default_to_fiat"
        case devBuyerFeeBasisPoints = "dev_buyer_fee_basis_points"
        case devSellerFeeBasisPoints = "dev_seller_fee_basis_points"
        case onlyProxiedTransfers = "only_proxied_transfers"
        case openseaBuyerFeeBasisPoints = "opensea_buyer_fee_basis_points"
        case openseaSellerFeeBasisPoints = "opensea_seller_fee_basis_points"
        case buyerFeeBasisPoints = "buyer_fee_basis_points"
        case sellerFeeBasisPoints = "seller_fee_basis_points"
        case payoutAddress = "payout_address"
    }
}

enum Address: String, Codable {
    case the0X495F947276749Ce646F68Ac8C248420045Cb7B5E = "0x495f947276749ce646f68ac8c248420045cb7b5e"
    case the0X7D70D50A8E9D1B4F04F5A2Fa2E46078Da9Ebb467 = "0x7d70d50a8e9d1b4f04f5a2fa2e46078da9ebb467"
}

enum AssetContractType: String, Codable {
    case nonFungible = "non-fungible"
    case semiFungible = "semi-fungible"
}

enum CreatedDate: String, Codable {
    case the20201202T174053232025 = "2020-12-02T17:40:53.232025"
    case the20211004T025931962120 = "2021-10-04T02:59:31.962120"
}

enum Name: String, Codable {
    case openSeaCollection = "OpenSea Collection"
    case pebbles = "Pebbles"
}

enum OpenseaVersion: String, Codable {
    case the200 = "2.0.0"
}

enum SchemaName: String, Codable {
    case erc1155 = "ERC1155"
    case erc721 = "ERC721"
}

enum Symbol: String, Codable {
    case openstore = "OPENSTORE"
    case pebbles = "PEBBLES"
}

// MARK: - Collection
struct Collection: Codable {
    let bannerImageURL: String?
    let chatURL: JSONNull?
    let createdDate: String
    let defaultToFiat: Bool
    let collectionDescription: String?
    let devBuyerFeeBasisPoints, devSellerFeeBasisPoints: String
    let discordURL: String?
    let displayData: DisplayData
    let externalURL: String?
    let featured: Bool
    let featuredImageURL: String?
    let hidden: Bool
    let safelistRequestStatus: SafelistRequestStatus
    let imageURL: String?
    let isSubjectToWhitelist: Bool
    let largeImageURL: String?
    let mediumUsername: JSONNull?
    let name: String
    let onlyProxiedTransfers: Bool
    let openseaBuyerFeeBasisPoints, openseaSellerFeeBasisPoints: String
    let payoutAddress: String?
    let requireEmail: Bool
    let shortDescription: JSONNull?
    let slug: String
    let telegramURL: String?
    let twitterUsername, instagramUsername: String?
    let wikiURL: JSONNull?

    enum CodingKeys: String, CodingKey {
        case bannerImageURL = "banner_image_url"
        case chatURL = "chat_url"
        case createdDate = "created_date"
        case defaultToFiat = "default_to_fiat"
        case collectionDescription = "description"
        case devBuyerFeeBasisPoints = "dev_buyer_fee_basis_points"
        case devSellerFeeBasisPoints = "dev_seller_fee_basis_points"
        case discordURL = "discord_url"
        case displayData = "display_data"
        case externalURL = "external_url"
        case featured
        case featuredImageURL = "featured_image_url"
        case hidden
        case safelistRequestStatus = "safelist_request_status"
        case imageURL = "image_url"
        case isSubjectToWhitelist = "is_subject_to_whitelist"
        case largeImageURL = "large_image_url"
        case mediumUsername = "medium_username"
        case name
        case onlyProxiedTransfers = "only_proxied_transfers"
        case openseaBuyerFeeBasisPoints = "opensea_buyer_fee_basis_points"
        case openseaSellerFeeBasisPoints = "opensea_seller_fee_basis_points"
        case payoutAddress = "payout_address"
        case requireEmail = "require_email"
        case shortDescription = "short_description"
        case slug
        case telegramURL = "telegram_url"
        case twitterUsername = "twitter_username"
        case instagramUsername = "instagram_username"
        case wikiURL = "wiki_url"
    }
}

// MARK: - DisplayData
struct DisplayData: Codable {
    let cardDisplayStyle: CardDisplayStyle
    let images: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case cardDisplayStyle = "card_display_style"
        case images
    }
}

enum CardDisplayStyle: String, Codable {
    case contain = "contain"
    case cover = "cover"
}

enum SafelistRequestStatus: String, Codable {
    case approved = "approved"
    case notRequested = "not_requested"
}

// MARK: - Creator
struct Creator: Codable {
    let user: User
    let profileImgURL: String
    let address, config: String

    enum CodingKeys: String, CodingKey {
        case user
        case profileImgURL = "profile_img_url"
        case address, config
    }
}

// MARK: - User
struct User: Codable {
    let username: String?
}

// MARK: - Trait
struct Trait: Codable {
    let traitType, value: String
    let displayType, maxValue: JSONNull?
    let traitCount: Int
    let order: JSONNull?

    enum CodingKeys: String, CodingKey {
        case traitType = "trait_type"
        case value
        case displayType = "display_type"
        case maxValue = "max_value"
        case traitCount = "trait_count"
        case order
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
