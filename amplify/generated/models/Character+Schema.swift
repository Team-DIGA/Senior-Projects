// swiftlint:disable all
import Amplify
import Foundation

extension Character {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case rarity
    case first_met_place
    case met_count
    case meet_stauts
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let character = Character.keys
    
    model.pluralName = "Characters"
    
    model.fields(
      .id(),
      .field(character.name, is: .required, ofType: .string),
      .field(character.rarity, is: .required, ofType: .int),
      .field(character.first_met_place, is: .required, ofType: .string),
      .field(character.met_count, is: .required, ofType: .int),
      .field(character.meet_stauts, is: .required, ofType: .bool),
      .field(character.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(character.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}