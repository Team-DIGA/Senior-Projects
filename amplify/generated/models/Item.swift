// swiftlint:disable all
import Amplify
import Foundation

public struct Item: Model {
  public let id: String
  public var name: String
  public var rarity: Int
  public var effect: String
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      name: String,
      rarity: Int,
      effect: String) {
    self.init(id: id,
      name: name,
      rarity: rarity,
      effect: effect,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      name: String,
      rarity: Int,
      effect: String,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.name = name
      self.rarity = rarity
      self.effect = effect
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}