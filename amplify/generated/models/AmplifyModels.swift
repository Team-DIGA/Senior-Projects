// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
<<<<<<< HEAD
  public let version: String = "4aee082a8ef9e5cb79cd209d62650848"
=======
  public let version: String = "826cbb7fcc29ecad097bc2416dc147db"
>>>>>>> f3ae8f27a42a4e961c5b31a00c0f39d0477701d1
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Character.self)
    ModelRegistry.register(modelType: Item.self)
    ModelRegistry.register(modelType: User.self)
  }
}