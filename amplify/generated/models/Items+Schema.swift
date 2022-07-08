// swiftlint:disable all
import Amplify
import Foundation

extension Items {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case rarity
    case effect
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let items = Items.keys
    
    model.pluralName = "Items"
    
    model.fields(
      .id(),
      .field(items.name, is: .required, ofType: .string),
      .field(items.rarity, is: .required, ofType: .int),
      .field(items.effect, is: .required, ofType: .string),
      .field(items.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(items.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}