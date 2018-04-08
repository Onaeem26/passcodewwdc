import UIKit

public class aboutCode: UIView {
    let picture = UIImageView(frame: CGRect(x: -111, y: 40, width: 100, height: 100 ))
    let title = UILabel(frame: CGRect(x: 666, y: 50, width: 150, height: 20))
    let info = UILabel(frame: CGRect(x: 666, y: 64, width: 160, height: 70))
    let about = UILabel(frame: CGRect(x: -111, y: 140, width: 340, height: 80))
    let detail = UILabel(frame: CGRect(x: -666, y: 180, width: 300, height: 50))
    let picture1 = UIImageView(frame: CGRect(x: -111, y: 225, width: 40, height: 40 ))
    let pic1Detail = UILabel(frame: CGRect(x: 666, y: 220, width: 270, height: 50))
    
    let picture2 = UIImageView(frame: CGRect(x: -111, y: 285, width: 40, height: 40 ))
    let pic2Detail = UILabel(frame: CGRect(x: 666, y: 270, width: 270, height: 70))
    
    let picture3 = UIImageView(frame: CGRect(x: -111, y: 310, width: 80, height: 80 ))
    let picture4 = UIImageView(frame: CGRect(x: -111, y: 310, width: 80, height: 80 ))
    let picture5 = UIImageView(frame: CGRect(x: -111, y: 310, width: 80, height: 80 ))
    
    
    
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
        picture.image = UIImage(named: "myPic.png")
        
        picture.contentMode = .scaleAspectFill
        addSubview(picture)
        
        
        title.text = "M. Osama Naeem"
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.textColor = .black
        addSubview(title)
        
        info.text = "Traveling\nPhotography\nProgramming\nInstagram: @madebyon"
        info.font = UIFont(name: "Avenir Next", size: 12)
        info.textColor = .black
        info.numberOfLines = 0;
        addSubview(info)
        
        pic1Detail.text = "App in progress - A simple To-Do application that lets you set tasks and reminder notifications"
        pic1Detail.font = UIFont(name: "Avenir Next", size: 12)
        pic1Detail.textColor = .black
        pic1Detail.numberOfLines = 0;
        addSubview(pic1Detail)
        
        about.text = "Coding,Traveling & I"
        about.font = UIFont.boldSystemFont(ofSize: 16)
        about.textColor = .black
        addSubview(about)
        
        detail.text = "Here are some of my photos from my travels + app I am working on:  "
        detail.numberOfLines = 0
        detail.font = UIFont(name: "Avenir Next", size: 12)
        detail.textColor = .black
        addSubview(detail)
        
        
        picture1.backgroundColor = .black
        picture1.image = UIImage(named: "icon.png")
        picture1.contentMode = .scaleAspectFill
        addSubview(picture1)
        

        picture3.backgroundColor = .black
        picture3.image = UIImage(named: "1wtc.png")
        picture3.contentMode = .scaleAspectFill
        addSubview(picture3)
            
        picture4.backgroundColor = .black
        picture4.image = UIImage(named: "switzerland.png")
        picture4.contentMode = .scaleAspectFill
        addSubview(picture4)
            
        picture5.backgroundColor = .black
        picture5.image = UIImage(named: "plane.png")
        picture5.contentMode = .scaleAspectFill
        addSubview(picture5)
        
        
        UIView.animate(withDuration: 1) {
            self.picture.frame = CGRect(x: 30, y: 40, width: 100, height: 100)
            self.title.frame = CGRect(x: 160, y: 50, width: 150, height: 30)
        }
        
        UIView.animate(withDuration: 1.2) {
            self.info.frame = CGRect(x: 160, y: 74, width: 160, height: 70)
            self.about.frame = CGRect(x: 30, y: 140, width: 320, height: 70)
            self.detail.frame =  CGRect(x: 30, y: 180, width: 300, height: 40)
            self.picture1.frame =  CGRect(x: 30, y: 235, width: 40, height: 40)
            self.pic1Detail.frame = CGRect(x: 90, y: 220, width: 240, height: 70)
            
             self.picture3.frame =  CGRect(x: 30, y: 310, width: 80, height: 80)
             self.picture4.frame =  CGRect(x: 135, y: 310, width: 80, height: 80)
             self.picture5.frame =  CGRect(x: 240, y: 310, width: 80, height: 80)
            
        }
        
        closeButton.frame = CGRect(x: 135, y: 420, width: 80, height: 20)
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(UIColor.black, for: .normal)
        closeButton.titleLabel?.font = UIFont(name: "Avenir Next", size: 14)
        //closeButton.addTarget(self, action: #selector(handleClose), for: .normal)
        addSubview(closeButton)
        
       backgroundColor = UIColor(red:0.90, green:0.92, blue:0.93, alpha:1.0)
        
        
        
    }
    
    
}
