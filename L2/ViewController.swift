import UIKit

class ViewController: UIViewController {
    
    let topStackView = TopNavigationStackView()
    let blueView = UIView()
    let bottomStackView = HomeBottomControlsStackView()
    let cardViewModels: [CardViewModel] = {
        let cards = [
            User(name: "Kelly", age: 23, profession: "Music DJ", imageNames: ["41","412","413"]),
            User(name: "Jasmin", age: 18, profession: "Teacher", imageNames: ["42","422","423"]),
            Advertiser(title: "Slide to the Right", brandName: "Women Power", posterPhotoNames: ["51"])
        ] as [ProducesCardViewModel]
        return cards.map({ (card) -> CardViewModel in
            return card.toCardViewModel()
        })
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupDummyCards()
    }

    // MARK:- fileprivate
    fileprivate func setupLayout() {
        let stackView = UIStackView.init(arrangedSubviews: [topStackView, blueView, bottomStackView])
        
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        
        stackView.bringSubviewToFront(blueView)
    }
    
    fileprivate func setupDummyCards() {
        cardViewModels.forEach { userVM in
            let cardView = CardView()
            cardView.cardViewModel = userVM
            blueView.addSubview(cardView)
            cardView.fillSuperview()
        }
    }

}

