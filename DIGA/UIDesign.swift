import UIKit

struct UiDesign {
    
    func buttonDesign (button: UIButton) {
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowOpacity = 10
        button.layer.shadowRadius = 10
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 10
    }
    
}
