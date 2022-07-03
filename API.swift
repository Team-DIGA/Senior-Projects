//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreateCharacterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, name: String, rarity: Int, firstMetPlace: String, metCount: Int, meetStauts: Bool, version: Int? = nil) {
    graphQLMap = ["id": id, "name": name, "rarity": rarity, "first_met_place": firstMetPlace, "met_count": metCount, "meet_stauts": meetStauts, "_version": version]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var rarity: Int {
    get {
      return graphQLMap["rarity"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "rarity")
    }
  }

  public var firstMetPlace: String {
    get {
      return graphQLMap["first_met_place"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "first_met_place")
    }
  }

  public var metCount: Int {
    get {
      return graphQLMap["met_count"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "met_count")
    }
  }

  public var meetStauts: Bool {
    get {
      return graphQLMap["meet_stauts"] as! Bool
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "meet_stauts")
    }
  }

  public var version: Int? {
    get {
      return graphQLMap["_version"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "_version")
    }
  }
}

public struct ModelCharacterConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(name: ModelStringInput? = nil, rarity: ModelIntInput? = nil, firstMetPlace: ModelStringInput? = nil, metCount: ModelIntInput? = nil, meetStauts: ModelBooleanInput? = nil, and: [ModelCharacterConditionInput?]? = nil, or: [ModelCharacterConditionInput?]? = nil, not: ModelCharacterConditionInput? = nil) {
    graphQLMap = ["name": name, "rarity": rarity, "first_met_place": firstMetPlace, "met_count": metCount, "meet_stauts": meetStauts, "and": and, "or": or, "not": not]
  }

  public var name: ModelStringInput? {
    get {
      return graphQLMap["name"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var rarity: ModelIntInput? {
    get {
      return graphQLMap["rarity"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "rarity")
    }
  }

  public var firstMetPlace: ModelStringInput? {
    get {
      return graphQLMap["first_met_place"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "first_met_place")
    }
  }

  public var metCount: ModelIntInput? {
    get {
      return graphQLMap["met_count"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "met_count")
    }
  }

  public var meetStauts: ModelBooleanInput? {
    get {
      return graphQLMap["meet_stauts"] as! ModelBooleanInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "meet_stauts")
    }
  }

  public var and: [ModelCharacterConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelCharacterConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelCharacterConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelCharacterConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelCharacterConditionInput? {
    get {
      return graphQLMap["not"] as! ModelCharacterConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelStringInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: String? = nil, eq: String? = nil, le: String? = nil, lt: String? = nil, ge: String? = nil, gt: String? = nil, contains: String? = nil, notContains: String? = nil, between: [String?]? = nil, beginsWith: String? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil, size: ModelSizeInput? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith, "attributeExists": attributeExists, "attributeType": attributeType, "size": size]
  }

  public var ne: String? {
    get {
      return graphQLMap["ne"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: String? {
    get {
      return graphQLMap["eq"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: String? {
    get {
      return graphQLMap["le"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: String? {
    get {
      return graphQLMap["lt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: String? {
    get {
      return graphQLMap["ge"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: String? {
    get {
      return graphQLMap["gt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: String? {
    get {
      return graphQLMap["contains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: String? {
    get {
      return graphQLMap["notContains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [String?]? {
    get {
      return graphQLMap["between"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: String? {
    get {
      return graphQLMap["beginsWith"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }

  public var size: ModelSizeInput? {
    get {
      return graphQLMap["size"] as! ModelSizeInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }
}

public enum ModelAttributeTypes: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  public typealias RawValue = String
  case binary
  case binarySet
  case bool
  case list
  case map
  case number
  case numberSet
  case string
  case stringSet
  case null
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "binary": self = .binary
      case "binarySet": self = .binarySet
      case "bool": self = .bool
      case "list": self = .list
      case "map": self = .map
      case "number": self = .number
      case "numberSet": self = .numberSet
      case "string": self = .string
      case "stringSet": self = .stringSet
      case "_null": self = .null
      default: self = .unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .binary: return "binary"
      case .binarySet: return "binarySet"
      case .bool: return "bool"
      case .list: return "list"
      case .map: return "map"
      case .number: return "number"
      case .numberSet: return "numberSet"
      case .string: return "string"
      case .stringSet: return "stringSet"
      case .null: return "_null"
      case .unknown(let value): return value
    }
  }

  public static func == (lhs: ModelAttributeTypes, rhs: ModelAttributeTypes) -> Bool {
    switch (lhs, rhs) {
      case (.binary, .binary): return true
      case (.binarySet, .binarySet): return true
      case (.bool, .bool): return true
      case (.list, .list): return true
      case (.map, .map): return true
      case (.number, .number): return true
      case (.numberSet, .numberSet): return true
      case (.string, .string): return true
      case (.stringSet, .stringSet): return true
      case (.null, .null): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct ModelSizeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, between: [Int?]? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }
}

public struct ModelIntInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, between: [Int?]? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between, "attributeExists": attributeExists, "attributeType": attributeType]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }
}

public struct ModelBooleanInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Bool? = nil, eq: Bool? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "attributeExists": attributeExists, "attributeType": attributeType]
  }

  public var ne: Bool? {
    get {
      return graphQLMap["ne"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Bool? {
    get {
      return graphQLMap["eq"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }
}

public struct UpdateCharacterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, name: String? = nil, rarity: Int? = nil, firstMetPlace: String? = nil, metCount: Int? = nil, meetStauts: Bool? = nil, version: Int? = nil) {
    graphQLMap = ["id": id, "name": name, "rarity": rarity, "first_met_place": firstMetPlace, "met_count": metCount, "meet_stauts": meetStauts, "_version": version]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return graphQLMap["name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var rarity: Int? {
    get {
      return graphQLMap["rarity"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "rarity")
    }
  }

  public var firstMetPlace: String? {
    get {
      return graphQLMap["first_met_place"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "first_met_place")
    }
  }

  public var metCount: Int? {
    get {
      return graphQLMap["met_count"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "met_count")
    }
  }

  public var meetStauts: Bool? {
    get {
      return graphQLMap["meet_stauts"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "meet_stauts")
    }
  }

  public var version: Int? {
    get {
      return graphQLMap["_version"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "_version")
    }
  }
}

public struct DeleteCharacterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, version: Int? = nil) {
    graphQLMap = ["id": id, "_version": version]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var version: Int? {
    get {
      return graphQLMap["_version"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "_version")
    }
  }
}

public struct ModelCharacterFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDInput? = nil, name: ModelStringInput? = nil, rarity: ModelIntInput? = nil, firstMetPlace: ModelStringInput? = nil, metCount: ModelIntInput? = nil, meetStauts: ModelBooleanInput? = nil, and: [ModelCharacterFilterInput?]? = nil, or: [ModelCharacterFilterInput?]? = nil, not: ModelCharacterFilterInput? = nil) {
    graphQLMap = ["id": id, "name": name, "rarity": rarity, "first_met_place": firstMetPlace, "met_count": metCount, "meet_stauts": meetStauts, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDInput? {
    get {
      return graphQLMap["id"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: ModelStringInput? {
    get {
      return graphQLMap["name"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var rarity: ModelIntInput? {
    get {
      return graphQLMap["rarity"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "rarity")
    }
  }

  public var firstMetPlace: ModelStringInput? {
    get {
      return graphQLMap["first_met_place"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "first_met_place")
    }
  }

  public var metCount: ModelIntInput? {
    get {
      return graphQLMap["met_count"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "met_count")
    }
  }

  public var meetStauts: ModelBooleanInput? {
    get {
      return graphQLMap["meet_stauts"] as! ModelBooleanInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "meet_stauts")
    }
  }

  public var and: [ModelCharacterFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelCharacterFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelCharacterFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelCharacterFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelCharacterFilterInput? {
    get {
      return graphQLMap["not"] as! ModelCharacterFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelIDInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: GraphQLID? = nil, eq: GraphQLID? = nil, le: GraphQLID? = nil, lt: GraphQLID? = nil, ge: GraphQLID? = nil, gt: GraphQLID? = nil, contains: GraphQLID? = nil, notContains: GraphQLID? = nil, between: [GraphQLID?]? = nil, beginsWith: GraphQLID? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil, size: ModelSizeInput? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith, "attributeExists": attributeExists, "attributeType": attributeType, "size": size]
  }

  public var ne: GraphQLID? {
    get {
      return graphQLMap["ne"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: GraphQLID? {
    get {
      return graphQLMap["eq"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: GraphQLID? {
    get {
      return graphQLMap["le"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: GraphQLID? {
    get {
      return graphQLMap["lt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: GraphQLID? {
    get {
      return graphQLMap["ge"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: GraphQLID? {
    get {
      return graphQLMap["gt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: GraphQLID? {
    get {
      return graphQLMap["contains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: GraphQLID? {
    get {
      return graphQLMap["notContains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [GraphQLID?]? {
    get {
      return graphQLMap["between"] as! [GraphQLID?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: GraphQLID? {
    get {
      return graphQLMap["beginsWith"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }

  public var size: ModelSizeInput? {
    get {
      return graphQLMap["size"] as! ModelSizeInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }
}

public final class CreateCharacterMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateCharacter($input: CreateCharacterInput!, $condition: ModelCharacterConditionInput) {\n  createCharacter(input: $input, condition: $condition) {\n    __typename\n    id\n    name\n    rarity\n    first_met_place\n    met_count\n    meet_stauts\n    createdAt\n    updatedAt\n    _version\n    _deleted\n    _lastChangedAt\n  }\n}"

  public var input: CreateCharacterInput
  public var condition: ModelCharacterConditionInput?

  public init(input: CreateCharacterInput, condition: ModelCharacterConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createCharacter", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateCharacter.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createCharacter: CreateCharacter? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createCharacter": createCharacter.flatMap { $0.snapshot }])
    }

    public var createCharacter: CreateCharacter? {
      get {
        return (snapshot["createCharacter"] as? Snapshot).flatMap { CreateCharacter(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createCharacter")
      }
    }

    public struct CreateCharacter: GraphQLSelectionSet {
      public static let possibleTypes = ["Character"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("rarity", type: .nonNull(.scalar(Int.self))),
        GraphQLField("first_met_place", type: .nonNull(.scalar(String.self))),
        GraphQLField("met_count", type: .nonNull(.scalar(Int.self))),
        GraphQLField("meet_stauts", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_deleted", type: .scalar(Bool.self)),
        GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, rarity: Int, firstMetPlace: String, metCount: Int, meetStauts: Bool, createdAt: String, updatedAt: String, version: Int, deleted: Bool? = nil, lastChangedAt: Int) {
        self.init(snapshot: ["__typename": "Character", "id": id, "name": name, "rarity": rarity, "first_met_place": firstMetPlace, "met_count": metCount, "meet_stauts": meetStauts, "createdAt": createdAt, "updatedAt": updatedAt, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var rarity: Int {
        get {
          return snapshot["rarity"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "rarity")
        }
      }

      public var firstMetPlace: String {
        get {
          return snapshot["first_met_place"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "first_met_place")
        }
      }

      public var metCount: Int {
        get {
          return snapshot["met_count"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "met_count")
        }
      }

      public var meetStauts: Bool {
        get {
          return snapshot["meet_stauts"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "meet_stauts")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var version: Int {
        get {
          return snapshot["_version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_version")
        }
      }

      public var deleted: Bool? {
        get {
          return snapshot["_deleted"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "_deleted")
        }
      }

      public var lastChangedAt: Int {
        get {
          return snapshot["_lastChangedAt"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_lastChangedAt")
        }
      }
    }
  }
}

public final class UpdateCharacterMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateCharacter($input: UpdateCharacterInput!, $condition: ModelCharacterConditionInput) {\n  updateCharacter(input: $input, condition: $condition) {\n    __typename\n    id\n    name\n    rarity\n    first_met_place\n    met_count\n    meet_stauts\n    createdAt\n    updatedAt\n    _version\n    _deleted\n    _lastChangedAt\n  }\n}"

  public var input: UpdateCharacterInput
  public var condition: ModelCharacterConditionInput?

  public init(input: UpdateCharacterInput, condition: ModelCharacterConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateCharacter", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateCharacter.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateCharacter: UpdateCharacter? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateCharacter": updateCharacter.flatMap { $0.snapshot }])
    }

    public var updateCharacter: UpdateCharacter? {
      get {
        return (snapshot["updateCharacter"] as? Snapshot).flatMap { UpdateCharacter(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateCharacter")
      }
    }

    public struct UpdateCharacter: GraphQLSelectionSet {
      public static let possibleTypes = ["Character"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("rarity", type: .nonNull(.scalar(Int.self))),
        GraphQLField("first_met_place", type: .nonNull(.scalar(String.self))),
        GraphQLField("met_count", type: .nonNull(.scalar(Int.self))),
        GraphQLField("meet_stauts", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_deleted", type: .scalar(Bool.self)),
        GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, rarity: Int, firstMetPlace: String, metCount: Int, meetStauts: Bool, createdAt: String, updatedAt: String, version: Int, deleted: Bool? = nil, lastChangedAt: Int) {
        self.init(snapshot: ["__typename": "Character", "id": id, "name": name, "rarity": rarity, "first_met_place": firstMetPlace, "met_count": metCount, "meet_stauts": meetStauts, "createdAt": createdAt, "updatedAt": updatedAt, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var rarity: Int {
        get {
          return snapshot["rarity"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "rarity")
        }
      }

      public var firstMetPlace: String {
        get {
          return snapshot["first_met_place"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "first_met_place")
        }
      }

      public var metCount: Int {
        get {
          return snapshot["met_count"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "met_count")
        }
      }

      public var meetStauts: Bool {
        get {
          return snapshot["meet_stauts"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "meet_stauts")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var version: Int {
        get {
          return snapshot["_version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_version")
        }
      }

      public var deleted: Bool? {
        get {
          return snapshot["_deleted"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "_deleted")
        }
      }

      public var lastChangedAt: Int {
        get {
          return snapshot["_lastChangedAt"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_lastChangedAt")
        }
      }
    }
  }
}

public final class DeleteCharacterMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteCharacter($input: DeleteCharacterInput!, $condition: ModelCharacterConditionInput) {\n  deleteCharacter(input: $input, condition: $condition) {\n    __typename\n    id\n    name\n    rarity\n    first_met_place\n    met_count\n    meet_stauts\n    createdAt\n    updatedAt\n    _version\n    _deleted\n    _lastChangedAt\n  }\n}"

  public var input: DeleteCharacterInput
  public var condition: ModelCharacterConditionInput?

  public init(input: DeleteCharacterInput, condition: ModelCharacterConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteCharacter", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteCharacter.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteCharacter: DeleteCharacter? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteCharacter": deleteCharacter.flatMap { $0.snapshot }])
    }

    public var deleteCharacter: DeleteCharacter? {
      get {
        return (snapshot["deleteCharacter"] as? Snapshot).flatMap { DeleteCharacter(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteCharacter")
      }
    }

    public struct DeleteCharacter: GraphQLSelectionSet {
      public static let possibleTypes = ["Character"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("rarity", type: .nonNull(.scalar(Int.self))),
        GraphQLField("first_met_place", type: .nonNull(.scalar(String.self))),
        GraphQLField("met_count", type: .nonNull(.scalar(Int.self))),
        GraphQLField("meet_stauts", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_deleted", type: .scalar(Bool.self)),
        GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, rarity: Int, firstMetPlace: String, metCount: Int, meetStauts: Bool, createdAt: String, updatedAt: String, version: Int, deleted: Bool? = nil, lastChangedAt: Int) {
        self.init(snapshot: ["__typename": "Character", "id": id, "name": name, "rarity": rarity, "first_met_place": firstMetPlace, "met_count": metCount, "meet_stauts": meetStauts, "createdAt": createdAt, "updatedAt": updatedAt, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var rarity: Int {
        get {
          return snapshot["rarity"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "rarity")
        }
      }

      public var firstMetPlace: String {
        get {
          return snapshot["first_met_place"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "first_met_place")
        }
      }

      public var metCount: Int {
        get {
          return snapshot["met_count"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "met_count")
        }
      }

      public var meetStauts: Bool {
        get {
          return snapshot["meet_stauts"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "meet_stauts")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var version: Int {
        get {
          return snapshot["_version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_version")
        }
      }

      public var deleted: Bool? {
        get {
          return snapshot["_deleted"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "_deleted")
        }
      }

      public var lastChangedAt: Int {
        get {
          return snapshot["_lastChangedAt"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_lastChangedAt")
        }
      }
    }
  }
}

public final class GetCharacterQuery: GraphQLQuery {
  public static let operationString =
    "query GetCharacter($id: ID!) {\n  getCharacter(id: $id) {\n    __typename\n    id\n    name\n    rarity\n    first_met_place\n    met_count\n    meet_stauts\n    createdAt\n    updatedAt\n    _version\n    _deleted\n    _lastChangedAt\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getCharacter", arguments: ["id": GraphQLVariable("id")], type: .object(GetCharacter.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getCharacter: GetCharacter? = nil) {
      self.init(snapshot: ["__typename": "Query", "getCharacter": getCharacter.flatMap { $0.snapshot }])
    }

    public var getCharacter: GetCharacter? {
      get {
        return (snapshot["getCharacter"] as? Snapshot).flatMap { GetCharacter(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getCharacter")
      }
    }

    public struct GetCharacter: GraphQLSelectionSet {
      public static let possibleTypes = ["Character"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("rarity", type: .nonNull(.scalar(Int.self))),
        GraphQLField("first_met_place", type: .nonNull(.scalar(String.self))),
        GraphQLField("met_count", type: .nonNull(.scalar(Int.self))),
        GraphQLField("meet_stauts", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_deleted", type: .scalar(Bool.self)),
        GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, rarity: Int, firstMetPlace: String, metCount: Int, meetStauts: Bool, createdAt: String, updatedAt: String, version: Int, deleted: Bool? = nil, lastChangedAt: Int) {
        self.init(snapshot: ["__typename": "Character", "id": id, "name": name, "rarity": rarity, "first_met_place": firstMetPlace, "met_count": metCount, "meet_stauts": meetStauts, "createdAt": createdAt, "updatedAt": updatedAt, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var rarity: Int {
        get {
          return snapshot["rarity"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "rarity")
        }
      }

      public var firstMetPlace: String {
        get {
          return snapshot["first_met_place"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "first_met_place")
        }
      }

      public var metCount: Int {
        get {
          return snapshot["met_count"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "met_count")
        }
      }

      public var meetStauts: Bool {
        get {
          return snapshot["meet_stauts"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "meet_stauts")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var version: Int {
        get {
          return snapshot["_version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_version")
        }
      }

      public var deleted: Bool? {
        get {
          return snapshot["_deleted"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "_deleted")
        }
      }

      public var lastChangedAt: Int {
        get {
          return snapshot["_lastChangedAt"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_lastChangedAt")
        }
      }
    }
  }
}

public final class ListCharactersQuery: GraphQLQuery {
  public static let operationString =
    "query ListCharacters($filter: ModelCharacterFilterInput, $limit: Int, $nextToken: String) {\n  listCharacters(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      name\n      rarity\n      first_met_place\n      met_count\n      meet_stauts\n      createdAt\n      updatedAt\n      _version\n      _deleted\n      _lastChangedAt\n    }\n    nextToken\n    startedAt\n  }\n}"

  public var filter: ModelCharacterFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelCharacterFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listCharacters", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListCharacter.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listCharacters: ListCharacter? = nil) {
      self.init(snapshot: ["__typename": "Query", "listCharacters": listCharacters.flatMap { $0.snapshot }])
    }

    public var listCharacters: ListCharacter? {
      get {
        return (snapshot["listCharacters"] as? Snapshot).flatMap { ListCharacter(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listCharacters")
      }
    }

    public struct ListCharacter: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelCharacterConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.object(Item.selections)))),
        GraphQLField("nextToken", type: .scalar(String.self)),
        GraphQLField("startedAt", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?], nextToken: String? = nil, startedAt: Int? = nil) {
        self.init(snapshot: ["__typename": "ModelCharacterConnection", "items": items.map { $0.flatMap { $0.snapshot } }, "nextToken": nextToken, "startedAt": startedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?] {
        get {
          return (snapshot["items"] as! [Snapshot?]).map { $0.flatMap { Item(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public var startedAt: Int? {
        get {
          return snapshot["startedAt"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "startedAt")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Character"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("rarity", type: .nonNull(.scalar(Int.self))),
          GraphQLField("first_met_place", type: .nonNull(.scalar(String.self))),
          GraphQLField("met_count", type: .nonNull(.scalar(Int.self))),
          GraphQLField("meet_stauts", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("_deleted", type: .scalar(Bool.self)),
          GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, rarity: Int, firstMetPlace: String, metCount: Int, meetStauts: Bool, createdAt: String, updatedAt: String, version: Int, deleted: Bool? = nil, lastChangedAt: Int) {
          self.init(snapshot: ["__typename": "Character", "id": id, "name": name, "rarity": rarity, "first_met_place": firstMetPlace, "met_count": metCount, "meet_stauts": meetStauts, "createdAt": createdAt, "updatedAt": updatedAt, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var rarity: Int {
          get {
            return snapshot["rarity"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "rarity")
          }
        }

        public var firstMetPlace: String {
          get {
            return snapshot["first_met_place"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "first_met_place")
          }
        }

        public var metCount: Int {
          get {
            return snapshot["met_count"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "met_count")
          }
        }

        public var meetStauts: Bool {
          get {
            return snapshot["meet_stauts"]! as! Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "meet_stauts")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var version: Int {
          get {
            return snapshot["_version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "_version")
          }
        }

        public var deleted: Bool? {
          get {
            return snapshot["_deleted"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "_deleted")
          }
        }

        public var lastChangedAt: Int {
          get {
            return snapshot["_lastChangedAt"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "_lastChangedAt")
          }
        }
      }
    }
  }
}

public final class SyncCharactersQuery: GraphQLQuery {
  public static let operationString =
    "query SyncCharacters($filter: ModelCharacterFilterInput, $limit: Int, $nextToken: String, $lastSync: AWSTimestamp) {\n  syncCharacters(filter: $filter, limit: $limit, nextToken: $nextToken, lastSync: $lastSync) {\n    __typename\n    items {\n      __typename\n      id\n      name\n      rarity\n      first_met_place\n      met_count\n      meet_stauts\n      createdAt\n      updatedAt\n      _version\n      _deleted\n      _lastChangedAt\n    }\n    nextToken\n    startedAt\n  }\n}"

  public var filter: ModelCharacterFilterInput?
  public var limit: Int?
  public var nextToken: String?
  public var lastSync: Int?

  public init(filter: ModelCharacterFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil, lastSync: Int? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
    self.lastSync = lastSync
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken, "lastSync": lastSync]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("syncCharacters", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken"), "lastSync": GraphQLVariable("lastSync")], type: .object(SyncCharacter.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(syncCharacters: SyncCharacter? = nil) {
      self.init(snapshot: ["__typename": "Query", "syncCharacters": syncCharacters.flatMap { $0.snapshot }])
    }

    public var syncCharacters: SyncCharacter? {
      get {
        return (snapshot["syncCharacters"] as? Snapshot).flatMap { SyncCharacter(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "syncCharacters")
      }
    }

    public struct SyncCharacter: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelCharacterConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.object(Item.selections)))),
        GraphQLField("nextToken", type: .scalar(String.self)),
        GraphQLField("startedAt", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?], nextToken: String? = nil, startedAt: Int? = nil) {
        self.init(snapshot: ["__typename": "ModelCharacterConnection", "items": items.map { $0.flatMap { $0.snapshot } }, "nextToken": nextToken, "startedAt": startedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?] {
        get {
          return (snapshot["items"] as! [Snapshot?]).map { $0.flatMap { Item(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public var startedAt: Int? {
        get {
          return snapshot["startedAt"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "startedAt")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Character"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("rarity", type: .nonNull(.scalar(Int.self))),
          GraphQLField("first_met_place", type: .nonNull(.scalar(String.self))),
          GraphQLField("met_count", type: .nonNull(.scalar(Int.self))),
          GraphQLField("meet_stauts", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("_deleted", type: .scalar(Bool.self)),
          GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, rarity: Int, firstMetPlace: String, metCount: Int, meetStauts: Bool, createdAt: String, updatedAt: String, version: Int, deleted: Bool? = nil, lastChangedAt: Int) {
          self.init(snapshot: ["__typename": "Character", "id": id, "name": name, "rarity": rarity, "first_met_place": firstMetPlace, "met_count": metCount, "meet_stauts": meetStauts, "createdAt": createdAt, "updatedAt": updatedAt, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var rarity: Int {
          get {
            return snapshot["rarity"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "rarity")
          }
        }

        public var firstMetPlace: String {
          get {
            return snapshot["first_met_place"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "first_met_place")
          }
        }

        public var metCount: Int {
          get {
            return snapshot["met_count"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "met_count")
          }
        }

        public var meetStauts: Bool {
          get {
            return snapshot["meet_stauts"]! as! Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "meet_stauts")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var version: Int {
          get {
            return snapshot["_version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "_version")
          }
        }

        public var deleted: Bool? {
          get {
            return snapshot["_deleted"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "_deleted")
          }
        }

        public var lastChangedAt: Int {
          get {
            return snapshot["_lastChangedAt"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "_lastChangedAt")
          }
        }
      }
    }
  }
}

public final class OnCreateCharacterSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateCharacter {\n  onCreateCharacter {\n    __typename\n    id\n    name\n    rarity\n    first_met_place\n    met_count\n    meet_stauts\n    createdAt\n    updatedAt\n    _version\n    _deleted\n    _lastChangedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateCharacter", type: .object(OnCreateCharacter.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateCharacter: OnCreateCharacter? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateCharacter": onCreateCharacter.flatMap { $0.snapshot }])
    }

    public var onCreateCharacter: OnCreateCharacter? {
      get {
        return (snapshot["onCreateCharacter"] as? Snapshot).flatMap { OnCreateCharacter(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateCharacter")
      }
    }

    public struct OnCreateCharacter: GraphQLSelectionSet {
      public static let possibleTypes = ["Character"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("rarity", type: .nonNull(.scalar(Int.self))),
        GraphQLField("first_met_place", type: .nonNull(.scalar(String.self))),
        GraphQLField("met_count", type: .nonNull(.scalar(Int.self))),
        GraphQLField("meet_stauts", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_deleted", type: .scalar(Bool.self)),
        GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, rarity: Int, firstMetPlace: String, metCount: Int, meetStauts: Bool, createdAt: String, updatedAt: String, version: Int, deleted: Bool? = nil, lastChangedAt: Int) {
        self.init(snapshot: ["__typename": "Character", "id": id, "name": name, "rarity": rarity, "first_met_place": firstMetPlace, "met_count": metCount, "meet_stauts": meetStauts, "createdAt": createdAt, "updatedAt": updatedAt, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var rarity: Int {
        get {
          return snapshot["rarity"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "rarity")
        }
      }

      public var firstMetPlace: String {
        get {
          return snapshot["first_met_place"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "first_met_place")
        }
      }

      public var metCount: Int {
        get {
          return snapshot["met_count"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "met_count")
        }
      }

      public var meetStauts: Bool {
        get {
          return snapshot["meet_stauts"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "meet_stauts")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var version: Int {
        get {
          return snapshot["_version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_version")
        }
      }

      public var deleted: Bool? {
        get {
          return snapshot["_deleted"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "_deleted")
        }
      }

      public var lastChangedAt: Int {
        get {
          return snapshot["_lastChangedAt"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_lastChangedAt")
        }
      }
    }
  }
}

public final class OnUpdateCharacterSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateCharacter {\n  onUpdateCharacter {\n    __typename\n    id\n    name\n    rarity\n    first_met_place\n    met_count\n    meet_stauts\n    createdAt\n    updatedAt\n    _version\n    _deleted\n    _lastChangedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateCharacter", type: .object(OnUpdateCharacter.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateCharacter: OnUpdateCharacter? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateCharacter": onUpdateCharacter.flatMap { $0.snapshot }])
    }

    public var onUpdateCharacter: OnUpdateCharacter? {
      get {
        return (snapshot["onUpdateCharacter"] as? Snapshot).flatMap { OnUpdateCharacter(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateCharacter")
      }
    }

    public struct OnUpdateCharacter: GraphQLSelectionSet {
      public static let possibleTypes = ["Character"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("rarity", type: .nonNull(.scalar(Int.self))),
        GraphQLField("first_met_place", type: .nonNull(.scalar(String.self))),
        GraphQLField("met_count", type: .nonNull(.scalar(Int.self))),
        GraphQLField("meet_stauts", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_deleted", type: .scalar(Bool.self)),
        GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, rarity: Int, firstMetPlace: String, metCount: Int, meetStauts: Bool, createdAt: String, updatedAt: String, version: Int, deleted: Bool? = nil, lastChangedAt: Int) {
        self.init(snapshot: ["__typename": "Character", "id": id, "name": name, "rarity": rarity, "first_met_place": firstMetPlace, "met_count": metCount, "meet_stauts": meetStauts, "createdAt": createdAt, "updatedAt": updatedAt, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var rarity: Int {
        get {
          return snapshot["rarity"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "rarity")
        }
      }

      public var firstMetPlace: String {
        get {
          return snapshot["first_met_place"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "first_met_place")
        }
      }

      public var metCount: Int {
        get {
          return snapshot["met_count"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "met_count")
        }
      }

      public var meetStauts: Bool {
        get {
          return snapshot["meet_stauts"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "meet_stauts")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var version: Int {
        get {
          return snapshot["_version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_version")
        }
      }

      public var deleted: Bool? {
        get {
          return snapshot["_deleted"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "_deleted")
        }
      }

      public var lastChangedAt: Int {
        get {
          return snapshot["_lastChangedAt"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_lastChangedAt")
        }
      }
    }
  }
}

public final class OnDeleteCharacterSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteCharacter {\n  onDeleteCharacter {\n    __typename\n    id\n    name\n    rarity\n    first_met_place\n    met_count\n    meet_stauts\n    createdAt\n    updatedAt\n    _version\n    _deleted\n    _lastChangedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteCharacter", type: .object(OnDeleteCharacter.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteCharacter: OnDeleteCharacter? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteCharacter": onDeleteCharacter.flatMap { $0.snapshot }])
    }

    public var onDeleteCharacter: OnDeleteCharacter? {
      get {
        return (snapshot["onDeleteCharacter"] as? Snapshot).flatMap { OnDeleteCharacter(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteCharacter")
      }
    }

    public struct OnDeleteCharacter: GraphQLSelectionSet {
      public static let possibleTypes = ["Character"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("rarity", type: .nonNull(.scalar(Int.self))),
        GraphQLField("first_met_place", type: .nonNull(.scalar(String.self))),
        GraphQLField("met_count", type: .nonNull(.scalar(Int.self))),
        GraphQLField("meet_stauts", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_deleted", type: .scalar(Bool.self)),
        GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, rarity: Int, firstMetPlace: String, metCount: Int, meetStauts: Bool, createdAt: String, updatedAt: String, version: Int, deleted: Bool? = nil, lastChangedAt: Int) {
        self.init(snapshot: ["__typename": "Character", "id": id, "name": name, "rarity": rarity, "first_met_place": firstMetPlace, "met_count": metCount, "meet_stauts": meetStauts, "createdAt": createdAt, "updatedAt": updatedAt, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var rarity: Int {
        get {
          return snapshot["rarity"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "rarity")
        }
      }

      public var firstMetPlace: String {
        get {
          return snapshot["first_met_place"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "first_met_place")
        }
      }

      public var metCount: Int {
        get {
          return snapshot["met_count"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "met_count")
        }
      }

      public var meetStauts: Bool {
        get {
          return snapshot["meet_stauts"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "meet_stauts")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var version: Int {
        get {
          return snapshot["_version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_version")
        }
      }

      public var deleted: Bool? {
        get {
          return snapshot["_deleted"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "_deleted")
        }
      }

      public var lastChangedAt: Int {
        get {
          return snapshot["_lastChangedAt"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_lastChangedAt")
        }
      }
    }
  }
}