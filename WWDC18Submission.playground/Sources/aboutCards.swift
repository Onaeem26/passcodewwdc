import UIKit

public class aboutCards: UIView {
    let picture = UIImageView(frame: CGRect(x: -111, y: 40, width: 100, height: 100 ))
    let title = UILabel(frame: CGRect(x: 666, y: 50, width: 150, height: 20))
    let info = UILabel(frame: CGRect(x: 666, y: 64, width: 150, height: 70))
    let about = UILabel(frame: CGRect(x: -111, y: 140, width: 150, height: 70))
  
    public let detail = UILabel(frame: CGRect(x: -666, y: 190, width: 300, height: 220))
    public let closeButton = UIButton(type: .system)
    
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
        picture.layer.cornerRadius = 50
        picture.layer.masksToBounds = true
        picture.backgroundColor = .black
        picture.image = UIImage(named: "dp.jpg")
        
        picture.contentMode = .scaleAspectFill
        addSubview(picture)
        
        
        title.text = "M. Osama Naeem"
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.textColor = .black
        addSubview(title)
        
        info.text = "BS in EEE, GIK Institute \nAge: 20 \nIslamabad, Pakistan"
        info.font = UIFont(name: "Avenir Next", size: 12)
        info.textColor = .black
        info.numberOfLines = 0;
        addSubview(info)
       
        about.text = "About Me"
        about.font = UIFont.boldSystemFont(ofSize: 18)
        about.textColor = .black
        addSubview(about)
        
        detail.text = "Hi, I am Osama Naeem and I am currently in 2nd semester studying Electronics Engineering from GIK Institute in Swabi, Pakistan.  I am 20 years old and live in Islamabad, Pak. In my free time I watch movies, play cricket/football, make videos on YouTube and code. I started coding when I was 14 and desgined wordpress themes etc. In 2011, I purchased an iPod and made tons of videos on it and posted them on YouTube. The combination of technology and filmaking always intrigued me. Then in 2014 I purchased a Macbook Air. Last year in March, I decided to learn Swift. It's been an amazing journey so far and can't wait to learn more about iOS Programming! "
        detail.numberOfLines = 0
        detail.font = UIFont(name: "Avenir Next", size: 12)
        detail.textColor = .black
        addSubview(detail)
        
        
        closeButton.frame = CGRect(x: 135, y: 420, width: 80, height: 20)
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(UIColor.black, for: .normal)
        closeButton.titleLabel?.font = UIFont(name: "Avenir Next", size: 14)
        //closeButton.addTarget(self, action: #selector(handleClose), for: .normal)
        addSubview(closeButton)

        
        UIView.animate(withDuration: 1) {
            self.picture.frame = CGRect(x: 30, y: 40, width: 100, height: 100)
            self.title.frame = CGRect(x: 160, y: 50, width: 150, height: 20)
        }
        
        UIView.animate(withDuration: 1.2) {
           self.info.frame = CGRect(x: 160, y: 64, width: 150, height: 70)
            self.about.frame = CGRect(x: 30, y: 140, width: 150, height: 70)
            self.detail.frame =  CGRect(x: 30, y: 190, width: 300, height: 220)
        }
        
        
      
        backgroundColor = UIColor(red:0.90, green:0.92, blue:0.93, alpha:1.0)
        

        
    }
    
  

}

