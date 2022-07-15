// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "826cbb7fcc29ecad097bc2416dc147db"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Character.self)
    ModelRegistry.register(modelType: Item.self)
    ModelRegistry.register(modelType: User.self)
  }
}