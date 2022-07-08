// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "f5a364e799a0bc008228d6664cb4c9f7"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Character.self)
    ModelRegistry.register(modelType: Items.self)
  }
}