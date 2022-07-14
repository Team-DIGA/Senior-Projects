// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "4aee082a8ef9e5cb79cd209d62650848"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Character.self)
    ModelRegistry.register(modelType: Item.self)
    ModelRegistry.register(modelType: User.self)
  }
}