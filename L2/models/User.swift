import UIKit

struct User: ProducesCardViewModel {
    let name: String
    let age: Int
    let profession: String
    let imageNames: [String]
    
    func toCardViewModel() -> CardViewModel {
        return CardViewModel(imageNames: imageNames, attributedString: getAttributedString(), textAlignment: NSTextAlignment.left)
    }
    
    fileprivate func getAttributedString() -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: name, attributes: [.font:UIFont.systemFont(ofSize: 36, weight: .heavy)])
        attributedText.append(NSAttributedString(string: "  \(age)", attributes: [.font:UIFont.systemFont(ofSize: 24, weight: .regular)]))
        attributedText.append(NSAttributedString(string: "\n\(profession)", attributes: [.font:UIFont.systemFont(ofSize: 20, weight: .regular)]))
        
        return attributedText
    }
}
