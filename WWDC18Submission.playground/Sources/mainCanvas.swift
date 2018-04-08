import UIKit


public class mainViewCanvas: UIView {
    
    let blackApple = UIImage(named: "blackApple")
    let colorApple = UIImage(named: "colorApple")
    let greyApple = UIImage(named: "greyApple")
  
    
    let mainGameView = mainCanvas(frame: CGRect(x: 125, y: -999, width: 500, height: 500))
    let tapCountLabel = UILabel(frame: CGRect(x: 370, y: 393, width: 12, height: 14))
    let tapLabel = UILabel(frame: CGRect(x: 345, y: 393, width: 90, height: 14))
    let introtext = UILabel(frame: CGRect(x: 320, y: 240, width: 120, height: 20))
    let path = UIBezierPath(arcCenter: .zero, radius: 25, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
    let text1 = UILabel(frame: CGRect(x: 250,y: 220,width: 62.5, height: 60))
    let text2 = UILabel(frame: CGRect(x: 312.5,y: 220,width: 62.5, height: 60))
    let text3 = UILabel(frame: CGRect(x: 375,y: 220,width: 62.5, height: 60))
    let text4 = UILabel(frame: CGRect(x: 437.5,y: 220,width: 62.5, height: 60))
    let box = UILabel(frame: CGRect(x: 500 ,y:219 , width:62.5 , height: 62))
    
    
    let path1 = UIBezierPath()
    let progressCircle = CAShapeLayer()
    let shapelayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    let wwdcBox = CAShapeLayer()
    let wwdcBox1 = CAShapeLayer()
    let wwdcbox3 = CAShapeLayer()
    var isShowing = false
    
    
    let maxTapCounts = 5
    var taps = 5
    var tapCount =  0
    
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
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        trackLayer1()
        tapCountLabel.text = "\(taps)"
        tapCountLabel.textColor = .black
        addSubview(tapCountLabel)
        showIntroTap()
        showTapProgress()
        t1()
        t2()
        t3()
        t4()
        backgroundColor = UIColor(red:0.93, green:0.93, blue:0.95, alpha:1.0)

    }
    
    @objc func handleTap() {
        
        tapCount = tapCount + 1
        let percentage = CGFloat(tapCount) / CGFloat(maxTapCounts)
        self.progressCircle.strokeEnd = percentage
        if (tapCount < maxTapCounts + 1){
            (0...10).forEach{(_) in
                generateAnimatedViews()
                taps = maxTapCounts - tapCount
              
                if (taps == 0)
                {
                    self.progressCircle.fillColor = UIColor.black.cgColor
                
                    self.trackLayer.isHidden = true
                    self.tapCountLabel.isHidden = true
                    self.createboxpath()
                    self.yearbox()
                    self.progressCircle.strokeEnd = percentage
                    
                    UIView.animate(withDuration: 0.2) {
                        self.progressCircle.transform =  CATransform3DMakeScale(0, 0, 1.0)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                      
                        self.createBoxAnimation()
                    })
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.3, execute: {
                        UIView.animate(withDuration: 0.5) {
                            self.wwdcbox3.isHidden = false
                        }
                    })
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.3, execute: {
                    
           
                        let animation = CABasicAnimation(keyPath: "position")
                        animation.fromValue = CGPoint(x: 0, y: 0)
                        animation.toValue = CGPoint(x: -100, y: 0)
                        animation.duration = 0.1
                        animation.fillMode = kCAFillModeForwards
                        animation.isRemovedOnCompletion = false
                        self.wwdcbox3.add(animation, forKey: "animate1")
                    })
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.6, execute: {
                        self.text1.isHidden = false
                        let animation = CABasicAnimation(keyPath: "position")
                        animation.fromValue = CGPoint(x: -100, y: 0)
                        animation.toValue = CGPoint(x: -37.5, y: 0)
                        animation.duration =   1
                        animation.fillMode = kCAFillModeForwards
                        animation.isRemovedOnCompletion = false
                        self.wwdcbox3.add(animation, forKey: "animate1")
                    })
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.8, execute: {
                        self.text2.isHidden = false
                        let animation = CABasicAnimation(keyPath: "position")
                        animation.fromValue = CGPoint(x: -37.5, y: 0)
                        animation.toValue = CGPoint(x: 25, y: 0)
                        animation.duration =   1
                        animation.fillMode = kCAFillModeForwards
                        animation.isRemovedOnCompletion = false
                        self.wwdcbox3.add(animation, forKey: "animate1")
                    })
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                        self.text3.isHidden = false
                        let animation = CABasicAnimation(keyPath: "position")
                        animation.fromValue = CGPoint(x: 25, y: 0)
                        animation.toValue = CGPoint(x: 87.5, y: 0)
                        animation.duration =   1
                        animation.fillMode = kCAFillModeForwards
                        animation.isRemovedOnCompletion = false
                        self.wwdcbox3.add(animation, forKey: "animate1")
                    })
                    DispatchQueue.main.asyncAfter(deadline: .now() + 6.2, execute: {
                        
                        self.text4.isHidden = false
                        let animation = CABasicAnimation(keyPath: "position")
                        animation.fromValue = CGPoint(x: 87.5, y: 0)
                        animation.toValue = CGPoint(x: 150, y: 0)
                        animation.duration =   1
                        animation.fillMode = kCAFillModeForwards
                        animation.isRemovedOnCompletion = false
                        self.wwdcbox3.add(animation, forKey: "animate1")
                       
                    })
                    DispatchQueue.main.asyncAfter(deadline: .now() + 7.3, execute: {
                       
                        self.wwdcbox3.isHidden = true
                    })
                    DispatchQueue.main.asyncAfter(deadline: .now() + 8.3, execute: {
                      
                        
                       self.text1.text = "2"
                        
                    })
                    DispatchQueue.main.asyncAfter(deadline: .now() + 8.5, execute: {
                        
                        
                        self.text2.text = "0"
                    })
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 8.7, execute: {
                        
                        
                        self.text3.text = "1"
                        
                    })
                    DispatchQueue.main.asyncAfter(deadline: .now() + 8.9, execute: {
                        
                        
                        self.text4.text = "8"
                        
                    })
                    DispatchQueue.main.asyncAfter(deadline: .now() + 9.9, execute: {
                        
                        
                        self.wwdcBox.isHidden = true
                        self.text1.isHidden = true
                        self.text2.isHidden = true
                        self.text3.isHidden = true
                        self.text4.isHidden = true
                        
                        self.showGame()
                        
                    })
                }else {
                    if (taps > 1)
                    {   introtext.isHidden = true
                        tapCountLabel.text = "\(taps)"
                    }else {
                        tapCountLabel.text = "\(taps)"
                    }
                    
                }
                
            }
        }
    }
    

    func generateAnimatedViews()
    {
        let img = drand48() * 1
        var image = UIImage()
        if (img < 0.3) {
            image = blackApple!
        }
        else if (img > 0.3 && img < 0.66)
        {
            image = greyApple!
        }else {
            image = colorApple!
        }
        let imageView = UIImageView(image: image)
        let size = 30 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 3
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        imageView.layer.add(animation, forKey: nil)
        addSubview(imageView)
        
    }
    
    func showTapProgress() {
        //Create track layeradd
        let center = CGPoint(x: 375, y: 400)
        progressCircle.path = path.cgPath
        progressCircle.strokeColor = UIColor.black.cgColor
        progressCircle.lineWidth = 5
        progressCircle.strokeEnd = 0
        progressCircle.zPosition = 3
        progressCircle.position = center
        progressCircle.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        progressCircle.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(progressCircle)
    }
    
    func trackLayer1() {
        let center = CGPoint(x: 375, y: 400)
        let path = UIBezierPath(arcCenter: .zero, radius: 25, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = path.cgPath
        trackLayer.strokeColor = UIColor.white.cgColor
        trackLayer.lineWidth = 5
        trackLayer.position = center
        trackLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        trackLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(trackLayer)
    }
    
    func animateTapProgress() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 2
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        progressCircle.add(animation, forKey: "animate")
    }
    
    func showIntroTap() {
        introtext.text = "Tap or Click!"
        introtext.font = UIFont(name: "Avenir Next", size: 18)
        addSubview(introtext)
    }
    
    func showGame() {
        
        UIView.animate(withDuration: 0.5) {
            self.mainGameView.frame = CGRect(x: 125, y: 0, width: 500, height: 500)
        }
        self.mainGameView.isShowing =  true
      
        addSubview(mainGameView)
        
        if (self.mainGameView.isShowing)
        {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.mainGameView.introlabel.text = "The 4 white circles shows the code to unlock a card about me!"
            self.mainGameView.introlabel.textColor = UIColor.black
            self.mainGameView.introlabel.font = UIFont(name: "Avenir Next" , size: 14)
            
            self.addSubview(self.mainGameView.introlabel)
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                
                self.mainGameView.introlabel.text = "Click the correct colored circle one by one in the correct order!"
                
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
                    
                    self.mainGameView.introlabel.isHidden = true
                    
                })
            })
        }
    }
    
    func createBoxAnimation() {
        let p1 = CGPoint(x: 250, y: 220 )
        let p2 = CGPoint(x: 500, y: 220 )
        let p3 = CGPoint(x: 500, y: 280 )
        let p4 = CGPoint(x: 250, y: 280 )
        let p5 = CGPoint(x: 250, y: 220 )
        
        
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
       
        path.addLine(to: p3)
        path.addLine(to: p4)
       
        path.addLine(to: p5)
        path.close()

        
        wwdcBox.path = path.cgPath
        wwdcBox.strokeColor = UIColor.black.cgColor
        wwdcBox.lineWidth = 2
        wwdcBox.strokeEnd = 0
        wwdcBox.fillColor = UIColor.clear.cgColor
        
        self.layer.addSublayer(wwdcBox)
        
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 2
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        wwdcBox.add(animation, forKey: "animate")
 }
    
    func createboxpath() {
        //Creating a box here
        let p1 = CGPoint(x: 350, y: 220 )
        let p2 = CGPoint(x: 412.5, y: 220 )
        let p3 = CGPoint(x: 412.5, y: 280 )
        let p4 = CGPoint(x: 350, y: 280 )
        let p5 = CGPoint(x: 350, y: 219 )
        
        
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.addLine(to: p4)
        path.addLine(to: p5)
        path.close()
        
        
        wwdcbox3.path = path.cgPath
        wwdcbox3.strokeColor = UIColor.black.cgColor
        wwdcbox3.lineWidth = 1
        wwdcbox3.zPosition = 1
        wwdcbox3.isHidden = true
        wwdcbox3.fillColor = UIColor.black.cgColor
        
        self.layer.addSublayer(wwdcbox3)
    }

    
    func t1() {
        text1.backgroundColor = .yellow
        text1.text = "W"
        text1.isHidden = true
        text1.textAlignment = .center
        text1.font = UIFont.boldSystemFont(ofSize: 28)
        addSubview(text1)
    }
    
    func t2() {
        text2.backgroundColor = .yellow
        text2.text = "W"
        text2.isHidden = true
        text2.textAlignment = .center
        text2.font = UIFont.boldSystemFont(ofSize: 28)
        addSubview(text2)
    }
    func t3() {
        text3.backgroundColor = .yellow
        text3.text = "D"
        text3.isHidden = true
        text3.textAlignment = .center
        text3.font = UIFont.boldSystemFont(ofSize: 28)
        addSubview(text3)
    }
    func t4() {
        text4.backgroundColor = .yellow
        text4.text = "C"
        text4.isHidden = true
        text4.textAlignment = .center
        text4.font = UIFont.boldSystemFont(ofSize: 28)
        addSubview(text4)
    }
    func yearbox() {
        box.backgroundColor = .black
        box.text = "18"
        box.textColor = UIColor.white
        box.isHidden = true
        box.textAlignment = .center
        box.font = UIFont.boldSystemFont(ofSize: 28)
        self.addSubview(box)
    }
    







}
