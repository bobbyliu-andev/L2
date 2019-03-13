import UIKit

struct Advertiser: ProducesCardViewModel {
    
    let title: String
    let brandName: String
    let posterPhotoNames: [String]
    
    func toCardViewModel() -> CardViewModel {
        return CardViewModel(imageNames: posterPhotoNames, attributedString: getAttributedString(), textAlignment: .center)
    }
    
    func getAttributedString() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: title, attributes: [.font:UIFont.systemFont(ofSize: 34, weight: .heavy)])
        attributedString.append(NSAttributedString(string: "\n"+brandName, attributes: [.font:UIFont.systemFont(ofSize: 24, weight: .regular)]))
        return attributedString
    }
}

