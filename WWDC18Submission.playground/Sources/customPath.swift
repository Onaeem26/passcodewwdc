import UIKit

public func customPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: 200))
    
    let endPoint = CGPoint(x: 770, y: 200)
    
    let shiftY = 200 + drand48() * 300
    
    let cp1 = CGPoint(x: 200, y: 50 - shiftY)
    let cp2 = CGPoint(x: 550, y: 335 + shiftY)
    path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
    
    return path
}
