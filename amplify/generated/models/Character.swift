// swiftlint:disable all
import Amplify
import Foundation

public struct Character: Model {
  public let id: String
  public var name: String
  public var rarity: Int
  public var first_met_place: String
  public var met_count: Int
  public var meet_status: Bool
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      name: String,
      rarity: Int,
      first_met_place: String,
      met_count: Int,
      meet_status: Bool) {
    self.init(id: id,
      name: name,
      rarity: rarity,
      first_met_place: first_met_place,
      met_count: met_count,
      meet_status: meet_status,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      name: String,
      rarity: Int,
      first_met_place: String,
      met_count: Int,
      meet_status: Bool,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.name = name
      self.rarity = rarity
      self.first_met_place = first_met_place
      self.met_count = met_count
      self.meet_status = meet_status
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}