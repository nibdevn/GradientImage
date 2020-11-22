import UIKit

public final class GradientImage {
    
    // MARK: - Con(De)structor
    public init(frame: CGRect,
                start: CGPoint = GradientDirection.bottom.startPoint,
                end: CGPoint = GradientDirection.bottom.endPoint,
                colors: [CGColor],
                locations: [NSNumber] = [])
    {
        gradientLayer.frame = frame
        gradientLayer.startPoint = start
        gradientLayer.endPoint = end
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        _colors = colors
        _locations = locations
    }

    public init(frame: CGRect,
                start: CGPoint = GradientDirection.bottom.startPoint,
                end: CGPoint = GradientDirection.bottom.endPoint,
                colors: [UIColor],
                locations: [NSNumber] = [])
    {
        gradientLayer.frame = frame
        gradientLayer.startPoint = start
        gradientLayer.endPoint = end
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = locations
        _colors = colors.map { $0.cgColor }
        _locations = locations
    }
    
    public init(frame: CGRect,
                direction: GradientDirection,
                colors: [CGColor],
                locations: [NSNumber])
    {
        gradientLayer.frame = frame
        gradientLayer.startPoint = direction.startPoint
        gradientLayer.endPoint = direction.endPoint
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        _colors = colors
        _locations = locations
    }

    public init(frame: CGRect,
                direction: GradientDirection,
                colors: [UIColor],
                locations: [NSNumber])
    {
        gradientLayer.frame = frame
        gradientLayer.startPoint = direction.startPoint
        gradientLayer.endPoint = direction.endPoint
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = locations
        _colors = colors.map { $0.cgColor }
        _locations = locations
    }
    
    // MARK: - Properties
    private let gradientLayer = CAGradientLayer() 
    private var isChanged: Bool = true
    private var tempImage: UIImage?
    private var _colors: [CGColor]
    private var _locations: [NSNumber]
    
    public var layer: CAGradientLayer { return gradientLayer }
    public var colors: [CGColor] { return _colors }
    public var locations: [NSNumber] { return _locations }
    public var image: UIImage? { return isChanged || tempImage == nil ? generate() : tempImage }
    
    private func generate() -> UIImage? {
        var gradientImage: UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        tempImage = gradientImage
        isChanged = false
        return tempImage
    }
    
    // MARK: - Public Methods
    @discardableResult
    public func setFrame(frame: CGRect) -> GradientImage {
        gradientLayer.frame = frame
        isChanged = true
        return self
    }
    
    @discardableResult
    public func setDirection(at direction: GradientDirection) -> GradientImage {
        gradientLayer.startPoint = direction.startPoint
        gradientLayer.endPoint = direction.endPoint
        isChanged = true
        return self
    }
    
    @discardableResult
    public func setStart(at start: CGPoint) -> GradientImage {
        gradientLayer.startPoint = start
        isChanged = true
        return self
    }
    
    @discardableResult
    public func setEnd(at end: CGPoint) -> GradientImage {
        gradientLayer.endPoint = end
        isChanged = true
        return self
    }
    
    @discardableResult
    public func setColors(colors: [UIColor]) -> GradientImage {
        return setColors(colors: colors.map { $0.cgColor })
    }
    
    @discardableResult
    public func setColors(colors: [CGColor]) -> GradientImage {
        gradientLayer.colors = colors
        isChanged = true
        _colors = colors
        return self
    }
    
    @discardableResult
    public func setLocations(locations: [NSNumber]) -> GradientImage {
        gradientLayer.locations = locations
        isChanged = true
        _locations = locations
        return self
    }
    
    @discardableResult
    public func setType(type: CAGradientLayerType) -> GradientImage {
        gradientLayer.type = type
        isChanged = true
        return self
    }
}
