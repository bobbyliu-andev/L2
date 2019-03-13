import UIKit

class RegisterViewController: UIViewController {
    
    let selectPhotoBtn: UIButton = {
        let btn = UIButton.init(type: .system)
        btn.backgroundColor = .white
        btn.setTitle("Select Photo", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        btn.heightAnchor.constraint(equalToConstant: 275).isActive = true
        btn.layer.cornerRadius = 16
        return btn
    }()
    
    let nameTF: CusTF = {
        let tf = CusTF(padding: 24)
        tf.placeholder = "Enter full name"
        return tf
    }()
    let emailTF: CusTF = {
        let tf = CusTF(padding: 24)
        tf.keyboardType = .emailAddress
        tf.placeholder = "Enter email"
        return tf
    }()
    let passwordTF: CusTF = {
        let tf = CusTF(padding: 24)
        tf.isSecureTextEntry = true
        tf.placeholder = "Enter password"
        return tf
    }()
    let registerBtn: UIButton = {
        let btn = UIButton.init(type: .system)
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btn.backgroundColor = UIColor.init(white: 0, alpha: 0.1)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .heavy)
        btn.setTitle("Register", for: .normal)
        btn.layer.cornerRadius = 25
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.colors = [#colorLiteral(red: 1, green: 0.4050004784, blue: 0.2709100391, alpha: 1).cgColor, #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1).cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.bounds
        
        setupLayout()
    }
    
    // MARK:- Private
    
    fileprivate func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [selectPhotoBtn, nameTF, emailTF, passwordTF, registerBtn])
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 64, bottom: 0, right: 64))
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    class CusTF: UITextField {
        
        fileprivate let padding: CGFloat
        
        init(padding: CGFloat) {
            self.padding = padding
            super.init(frame: .zero)
            backgroundColor = .white
            layer.cornerRadius = 25
        }
        
        override var intrinsicContentSize: CGSize {
            return CGSize.init(width: 0, height: 50)
        }
        
        override func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: padding, dy: 0)
        }
        
        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: padding, dy: 0)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
}
