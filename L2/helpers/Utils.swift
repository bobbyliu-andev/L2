import UIKit

extension UIView {
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        guard let sv = superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: sv.topAnchor, constant: padding.top).isActive = true
        leadingAnchor.constraint(equalTo: sv.leadingAnchor, constant: padding.left).isActive = true
        bottomAnchor.constraint(equalTo: sv.bottomAnchor, constant: -padding.bottom).isActive = true
        trailingAnchor.constraint(equalTo: sv.trailingAnchor, constant: -padding.right).isActive = true
    }
}
