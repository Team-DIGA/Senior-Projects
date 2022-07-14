// swiftlint:disable all
import Amplify
import Foundation

public struct User: Model {
  public let id: String
  public var name: String
  public var friends: [String]?
  public var items: [String]?
  public var level: Int
  public var money: Int
  public var exp: Int
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      name: String,
      friends: [String]? = nil,
      items: [String]? = nil,
      level: Int,
      money: Int,
      exp: Int) {
    self.init(id: id,
      name: name,
      friends: friends,
      items: items,
      level: level,
      money: money,
      exp: exp,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      name: String,
      friends: [String]? = nil,
      items: [String]? = nil,
      level: Int,
      money: Int,
      exp: Int,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.name = name
      self.friends = friends
      self.items = items
      self.level = level
      self.money = money
      self.exp = exp
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}