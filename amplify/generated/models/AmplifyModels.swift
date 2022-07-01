// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "7bbd3eb82228fc26056aeea5d52a1bfc"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Character.self)
  }
}