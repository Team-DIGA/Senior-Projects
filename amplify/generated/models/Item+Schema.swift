// swiftlint:disable all
import Amplify
import Foundation

extension Item {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case rarity
    case effect
    case item_count
    case update_count
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let item = Item.keys
    
    model.pluralName = "Items"
    
    model.fields(
      .id(),
      .field(item.name, is: .required, ofType: .string),
      .field(item.rarity, is: .required, ofType: .int),
      .field(item.effect, is: .required, ofType: .string),
      .field(item.item_count, is: .required, ofType: .int),
      .field(item.update_count, is: .required, ofType: .int),
      .field(item.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(item.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}