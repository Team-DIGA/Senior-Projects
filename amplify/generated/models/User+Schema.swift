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
    case update_count
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
      .field(user.friends, is: .optional, ofType: .embeddedCollection(of: String.self)),
      .field(user.items, is: .optional, ofType: .embeddedCollection(of: String.self)),
      .field(user.level, is: .required, ofType: .int),
      .field(user.money, is: .required, ofType: .int),
      .field(user.exp, is: .required, ofType: .int),
<<<<<<< HEAD
=======
      .field(user.update_count, is: .required, ofType: .int),
>>>>>>> f3ae8f27a42a4e961c5b31a00c0f39d0477701d1
      .field(user.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(user.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}