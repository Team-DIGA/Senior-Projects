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
    let user = User.keys
    
    model.pluralName = "Users"
    
    model.fields(
      .id(),
      .field(user.name, is: .required, ofType: .string),
      .field(user.friends, is: .optional, ofType: .embeddedCollection(of: Int.self)),
      .field(user.items, is: .optional, ofType: .embeddedCollection(of: Int.self)),
      .field(user.level, is: .optional, ofType: .int),
      .field(user.money, is: .optional, ofType: .int),
      .field(user.exp, is: .optional, ofType: .int),
      .field(user.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(user.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}