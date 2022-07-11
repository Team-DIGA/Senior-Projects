// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "03b846788a75499fbd45f4bfe13f000e"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Character.self)
    ModelRegistry.register(modelType: Items.self)
    ModelRegistry.register(modelType: Users.self)
  }
}