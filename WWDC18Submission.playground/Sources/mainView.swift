import UIKit
import AVFoundation

public class mainCanvas: UIView {

    var count: Int = 0
    var previousNumber: UInt32?
    private var displayLink: CADisplayLink?
    private var startTime = 0.0
    private let animationLength = 600.0
    var player: AVAudioPlayer?
    var correctPlayer: AVAudioPlayer?
    public var isShowing = false
    
    var circleviews = [circles]() //For storing circles
    var baseCircles = [baseCircle]() //For storing base views
    var circleSet = [circles]()
    
    var turncount: Int = 0 //counts which turn you are on
    var baseNumbersArray = [Int]() //Numbers from 1 to 12 in a array
    var timecount: Int = 0 //One whole turn is completed
    
    var card = aboutCards()
    var card2 = aboutCode()
    var finalCard1 = finalCard()
    
    let color1 = UIColor(red:0.00, green:1.00, blue:0.78, alpha:1.0)
    let color2 = UIColor(red:0.00, green:0.59, blue:0.97, alpha:1.0)
    let color3 = UIColor(red:1.00, green:0.67, blue:0.00, alpha:1.0)
    let color4 = UIColor(red:0.07, green:0.78, blue:0.63, alpha:1.0)
    
    public let introlabel = UILabel(frame: CGRect(x: 155, y: 5 , width: 490,height:30 ))
   
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
        DispatchQueue.global(qos: .background).async {
            
            self.playSound()
            self.correctPlayer?.prepareToPlay()
            self.correctPlayer?.volume = 0
            self.correctPlayer?.play()
            
            self.playWrongSound()
            self.player?.prepareToPlay()
            self.player?.volume = 0
            self.player?.play()
        }
        
      
       
        reloadBaseViews()
        

      for var i in 1...12 {

                let randindex = drand48() * 1
                var color : UIColor = .red
                if (randindex < 0.33)
                {
                    color = color3
                } else if (randindex > 0.33 && randindex < 0.66)
                {
                    color = color2
                } else if (randindex > 0.66 && randindex < 0.99)
                {
                    color = color4
                }
                
                
             
               let view = circles(frame: CGRect(x: 200 , y: 200, width: 40, height: 40))
                view.layer.cornerRadius = 20 
                view.layer.masksToBounds = true
                view.isSelected = false
                view.num = i
                view.layer.zPosition = 4
                view.text = "   \(view.num)"
                view.textColor = .white
                view.isUserInteractionEnabled = true
        
                view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap1)))
                view.backgroundColor = color
                view.velocity.x = CGFloat(arc4random_uniform(100) + 50 )/100.0
                view.velocity.y = CGFloat(arc4random_uniform(100) + 50)/100.0
                
                addSubview(view)
                circleviews.append(view as! circles)
        
             
                stopDisplayLink()
                startTime = CACurrentMediaTime()
                let displayLink = CADisplayLink(
                    target: self, selector: #selector(movecircle)
                )
                displayLink.add(to: .main, forMode: .commonModes)
                self.displayLink = displayLink
        }
            

        backgroundColor = UIColor(red:0.93, green:0.93, blue:0.95, alpha:1.0)
        
    }
    
    @objc func movecircle(_ displayLink: CADisplayLink) {
        var elapsed = CACurrentMediaTime() - startTime
        
        if elapsed > animationLength {
            stopDisplayLink()
            elapsed = animationLength
        }
        for circle in circleviews {
            if (!circle.isSelected)
            {
            circle.center.x += circle.velocity.x
            circle.center.y += circle.velocity.y
            
            if (circle.center.x > 490 || circle.center.x < 0  ) {
                circle.velocity.x *= -1.0
            } else if(circle.center.y > 490 || circle.center.y < 150)
            {
                circle.velocity.y *= -1.0
            }
            }
        }
    }
    
   
    
    
    @objc func handleTap1(sender: UITapGestureRecognizer) {
        let viewtapped = sender.view! as! circles
        viewtapped.isSelected = true
        count = count + 1
        switch count {
        case 1:
            
            interactionDisabledCircle()
            UIView.animate(withDuration: 3, delay: 0.0, options: [], animations: {
                viewtapped.center = CGPoint(x: 170, y: 95)
            }, completion: { (finished: Bool) in
                if (viewtapped.num == self.baseCircles[self.count - 1].baseNum)
                {
                   
                    
                    self.playSound()
                    self.correctPlayer?.play()
                    
                    self.circleSet.append(viewtapped as! circles)
                    self.turncount = self.turncount + 1
                    self.interactionEnabledCircle()
                } else {
                    
                    viewtapped.isSelected = false
                    
                    DispatchQueue.global(qos: .background).async {
                        self.playWrongSound()
                        self.player?.play()
                    }
                    viewtapped.center = self.randomCoordinates()
                    self.count = self.count - 1
                    self.interactionEnabledCircle()
                }
            })
            
        case 2:
            interactionDisabledCircle()
            UIView.animate(withDuration: 3, delay: 0.0, options: [], animations: {
                viewtapped.center = CGPoint(x: 220, y: 95)
            }, completion: { (finished: Bool) in
                if (viewtapped.num == self.baseCircles[self.count - 1].baseNum)
                {
                  
                    self.playSound()
                    self.correctPlayer?.play()
                    self.circleSet.append(viewtapped as! circles)
                    self.turncount = self.turncount + 1
                    self.interactionEnabledCircle()
                    
                }else {
                    
                    viewtapped.isSelected = false
                    self.playWrongSound()
                    self.player?.play()
                    viewtapped.center = self.randomCoordinates()
                    self.count = self.count - 1
                    self.interactionEnabledCircle()
                }
            })
            
        case 3:
            
            interactionDisabledCircle()
            UIView.animate(withDuration: 3, delay: 0.0, options: [], animations: {
                 viewtapped.center = CGPoint(x: 270, y: 95)
            }, completion: { (finished: Bool) in
                if (viewtapped.num == self.baseCircles[self.count - 1].baseNum)
                {
                   
                    self.playSound()
                    self.correctPlayer?.play()
                    self.circleSet.append(viewtapped as! circles)
                    self.turncount = self.turncount + 1
                    self.interactionEnabledCircle()
                    
                }else {
                    
                    viewtapped.isSelected = false
                    self.playWrongSound()
                    self.player?.play()
                    viewtapped.center = self.randomCoordinates()
                    self.count = self.count - 1
                    self.interactionEnabledCircle()
                }
            })
           
            
        case 4:
            
            interactionDisabledCircle()
            UIView.animate(withDuration: 3, delay: 0.0, options: [], animations: {
                viewtapped.center = CGPoint(x: 320, y: 95)
            }, completion: { (finished: Bool) in
                if (viewtapped.num == self.baseCircles[self.count - 1].baseNum)
                {
                   
                    self.playSound()
                    self.correctPlayer?.play()
                    self.circleSet.append(viewtapped as! circles)
                    self.turncount = self.turncount + 1
                    self.timecount = self.timecount + 1
                    self.count = 0
                    if (self.turncount == 4)
                    {
                        if (self.timecount < 3) // Gets incremented once all 4 bases are successfully approached
                        {
                            
                            if (self.timecount == 1)
                            {
                               self.showCard1()
                            } else if (self.timecount == 2)
                            {
                                self.showCard2()
                            }
                            
                            self.hideSetCircle()
                            self.circleSet.removeAll()
                            self.reloadBaseViews()
                            self.turncount = 0
                            
                        } else {
                            
                            self.showFinalCard()
                            print("Game Over")
                        }
                        
                      
                    }
                    self.interactionEnabledCircle()
                    
                } else {
                    viewtapped.isSelected = false
                    self.playWrongSound()
                    self.player?.play()
                    viewtapped.center = self.randomCoordinates()
                    self.count = self.count - 1
                    self.interactionEnabledCircle()
                }

                
            })
           
        default:
            return
        }
        
        
    }
    
    func randomNumber() -> UInt32 {
        var randomNumber = arc4random_uniform(12) + 1
        return randomNumber
    }

   func stopDisplayLink() {
        displayLink?.invalidate()
        displayLink = nil
    }
    
    func randomCoordinates()-> CGPoint {
        let randomx = Int(arc4random_uniform(100) + 100)
        let randomy = Int(arc4random_uniform(100) + 150)
        
        let randomPoint = CGPoint(x: randomx, y: randomy)
        return randomPoint
    }

    func interactionDisabledCircle() {
        for circle in circleviews {
            circle.isUserInteractionEnabled = false
        }
    }
    
    func interactionEnabledCircle() {
        for circle in circleviews {
            circle.isUserInteractionEnabled = true
        }
    }
    
    func reloadBaseViews() {
        
        baseCircles.removeAll()
       
        for j in 0...3 {
            
            let base = baseCircle(frame: CGRect(x: 150 + (CGFloat)(j) * 50, y: 75, width: 40 , height: 40 ))
            var rn = randomNumber()
            
            while(baseNumbersArray.contains(Int(rn)))
            {
                rn = randomNumber()
            }
            
            base.baseNum = Int(rn)
            baseNumbersArray.append(Int(rn))
            base.text = "   \(rn) "
            base.backgroundColor = .white
            base.layer.borderColor = UIColor(red:0.31, green:0.31, blue:0.31, alpha:1.0).cgColor
            base.layer.borderWidth = 2
            base.layer.cornerRadius = 20
            base.layer.masksToBounds = true
            base.baseId = j
            
            baseCircles.append(base as! baseCircle)
            
            addSubview(base)
      
        }
    }
    
    func hideSetCircle() {
        for cirview in circleSet {
            cirview.isHidden = true
        }
    }
    
    func showCard1() {
        
        card = aboutCards(frame: CGRect(x: 75, y: -999, width: 350, height: 500))
        UIView.animate(withDuration: 0.5) {
            self.card.frame = CGRect(x: 75, y: 25, width: 350, height: 450)
        }
        card.closeButton.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        card.layer.borderColor = UIColor.black.cgColor
        card.layer.borderWidth = 2
        card.layer.cornerRadius = 5
        card.layer.masksToBounds = true
        card.layer.zPosition = 5
        addSubview(card)

    }
    
    func showCard2() {
        
        card2 = aboutCode(frame: CGRect(x: 75, y: -999, width: 350, height: 450))
        card2.closeButton.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        card2.layer.borderColor = UIColor.black.cgColor
        card2.layer.borderWidth = 2
        card2.layer.cornerRadius = 5
        card2.layer.masksToBounds = true
        card2.layer.zPosition = 5
        addSubview(card2)
        UIView.animate(withDuration: 0.5) {
           self.card2.frame = CGRect(x: 75, y: 25, width: 350, height: 450)
        }
        
        
    }
    
    func showFinalCard() {
        finalCard1 = finalCard(frame: CGRect(x: 125, y: 75, width: 250, height: 350))
        finalCard1.layer.zPosition = 5
        addSubview(finalCard1)
    }
    
    @objc func handleClose(sender: UIButton){
        UIView.animate(withDuration: 0.5) {
        self.card.frame = CGRect(x: 75, y: -999, width: 350, height: 500)
    }
        UIView.animate(withDuration: 0.5) {
        self.card2.frame = CGRect(x: 75, y: -999, width: 350, height: 500)
    }
    }
    

     func playSound() {
        guard let url = Bundle.main.url(forResource: "correctsound", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
         
            correctPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = correctPlayer else { return }
            
            
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playWrongSound() {
        guard let url = Bundle.main.url(forResource: "incorrect", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else { return }
            
        
        } catch let error {
            print(error.localizedDescription)
        }
    }
    

  
}


    

    

    
    


