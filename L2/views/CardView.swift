import UIKit

class CardView: UIView {
    
    var cardViewModel: CardViewModel! {
        didSet {
            imageView.image = UIImage(named: cardViewModel.imageNames.first ?? "")
            informationLable.attributedText = cardViewModel.attributedString
            informationLable.textAlignment = cardViewModel.textAlignment
            
            (0..<cardViewModel.imageNames.count).forEach { index in
                let v = UIView()
                v.backgroundColor = barDeselectedColor
                bar.addArrangedSubview(v)
            }
            
            bar.arrangedSubviews.first?.backgroundColor = .white
            
            cardViewModel.imageIndexObserver = { [unowned self] (idx, image) in
                // update bar
                self.bar.arrangedSubviews.forEach { v in
                    v.backgroundColor = self.barDeselectedColor
                }
                self.bar.arrangedSubviews[idx].backgroundColor = .white
                
                self.imageView.image = image
            }
        }
    }
    
    fileprivate let imageView = UIImageView(image: #imageLiteral(resourceName: "41"))
    fileprivate let gradientLayer = CAGradientLayer()
    fileprivate let informationLable = UILabel()
    fileprivate let bar = UIStackView()
    
    fileprivate var imageIndex = 0
    
    // MARK:- Configurations
    fileprivate let threshold: CGFloat = 100
    fileprivate let barDeselectedColor = UIColor.init(white: 0, alpha: 0.1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
        
        let tapGestrue = UITapGestureRecognizer(target: self, action: #selector(handleTap(gesture:)))
        addGestureRecognizer(tapGestrue)
    }
    
    fileprivate func setupGradient() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5, 1.1]
        
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = self.frame
    }
    
    fileprivate func setupLayout() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        setupGradient()
        setBar()
        
        addSubview(informationLable)
        informationLable.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        informationLable.textColor = .white
        informationLable.numberOfLines = 0
    }
    
    fileprivate func setBar() {
        addSubview(bar)
        bar.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 4))
        bar.spacing = 8
        bar.distribution = .fillEqually
        
        
    }
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
        
        switch gesture.state {
        case .began:
            handleBegan()
        case .changed:
            handleChanged(gesture)
        case .ended:
            handleEnded(gesture)
        default:
            ()
        }
    }
    
    @objc fileprivate func handleTap(gesture: UITapGestureRecognizer) {
        let x = gesture.location(in: nil).x
        let shouldAdvance = x > self.frame.width / 2 ? true : false
        
        if shouldAdvance {
            cardViewModel.advanceNext()
        } else {
            cardViewModel.goToPrevious()
        }
    }
    
    fileprivate func handleBegan() {
        superview?.subviews.forEach({ v in
            v.layer.removeAllAnimations()
        })
    }
    
    fileprivate func handleChanged(_ gesture: UIPanGestureRecognizer) {
        let translate = gesture.translation(in: nil)
        let degree = translate.x * .pi / 180 / 20
        let rotateTransform = CGAffineTransform(rotationAngle: degree).translatedBy(x: translate.x, y: translate.y)
        transform = rotateTransform
    }
    
    fileprivate func handleEnded(_ gesture: UIPanGestureRecognizer) {
        let translateDirection: CGFloat = gesture.translation(in: nil).x > 0 ? 1 : -1
        let shouldDismissCard = abs(gesture.translation(in: nil).x) > threshold
        
        UIView.animate(withDuration: 0.55, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            if shouldDismissCard {
                self.frame = CGRect(x: 600*translateDirection, y: 0, width: self.frame.width, height: self.frame.height)
            } else {
                // original value
                self.transform = .identity
            }
        }, completion: { _ in
            self.transform = .identity
            if shouldDismissCard {
                self.removeFromSuperview()
            }
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
