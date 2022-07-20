// swiftlint:disable all
import Amplify
import Foundation

public struct Item: Model {
  public let id: String
  public var name: String
  public var rarity: Int
  public var effect: String
  public var item_count: Int
  public var update_count: Int
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      name: String,
      rarity: Int,
      effect: String,
      item_count: Int,
      update_count: Int) {
    self.init(id: id,
      name: name,
      rarity: rarity,
      effect: effect,
      item_count: item_count,
      update_count: update_count,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      name: String,
      rarity: Int,
      effect: String,
      item_count: Int,
      update_count: Int,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.name = name
      self.rarity = rarity
      self.effect = effect
      self.item_count = item_count
      self.update_count = update_count
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}