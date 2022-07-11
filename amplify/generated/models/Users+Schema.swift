// swiftlint:disable all
import Amplify
import Foundation

extension User {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case friends
    case items
    case level
    case money
    case exp
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let users = User.keys
    
    model.pluralName = "Users"
    
    model.fields(
      .id(),
      .field(users.name, is: .required, ofType: .string),
      .field(users.friends, is: .optional, ofType: .embeddedCollection(of: Int.self)),
      .field(users.items, is: .optional, ofType: .embeddedCollection(of: Int.self)),
      .field(users.level, is: .optional, ofType: .int),
      .field(users.money, is: .optional, ofType: .int),
      .field(users.exp, is: .optional, ofType: .int),
      .field(users.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(users.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}
