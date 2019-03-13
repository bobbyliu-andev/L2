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
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraintes = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraintes.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraintes.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraintes.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraintes.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraintes.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraintes.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraintes.top, anchoredConstraintes.leading, anchoredConstraintes.bottom, anchoredConstraintes.trailing, anchoredConstraintes.width, anchoredConstraintes.height].forEach { constraint in
            constraint?.isActive = true
        }
        
        return anchoredConstraintes
    }
}

struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}
