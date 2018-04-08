import UIKit

public class finalCard: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    func setupView() {
      
        let title = UILabel(frame: CGRect(x: 82, y: 20, width: 85, height: 44))
        title.text = "WWDC"
        title.font = UIFont.boldSystemFont(ofSize: 22)
        title.textColor = UIColor(red:1.00, green:0.67, blue:0.00, alpha:1.0)
        addSubview(title)
        
        let detail = UILabel(frame: CGRect(x: 40, y: 66, width: 170, height: 150))
        detail.text = "Thank you for reviewing my application! I really hope to get a chance to meet you and other brilliant engineers and developers at WWDC! \n\nHave a nice day! "
        detail.font = UIFont.boldSystemFont(ofSize: 14)
        detail.textAlignment = .center
        detail.numberOfLines = 0
        detail.textColor = UIColor(red:0.31, green:0.31, blue:0.31, alpha:1.0)
        addSubview(detail)
        
        let applelogo = UIImageView(frame: CGRect(x: 90, y: 242, width: 70, height: 70 ))
        
        applelogo.image = UIImage(named: "applelogo.png")
        applelogo.contentMode = .scaleAspectFill
        addSubview(applelogo)

        
        
        
        
        
        
        
        
        backgroundColor = UIColor(red:0.93, green:0.93, blue:0.95, alpha:1.0)
        
        
        
    }
    
    
    
}

