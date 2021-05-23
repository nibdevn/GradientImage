#if canImport(UIKit)
import UIKit

public final class Gradient {
    
    // MARK: - Con(De)structor
    public init(frame: CGRect,
                start: CGPoint = GradientDirection.bottom.startPoint,
                end: CGPoint = GradientDirection.bottom.endPoint,
                cgColors: [CGColor],
                locations: [NSNumber]? = nil)
    {
        _layer.frame = frame
        _layer.startPoint = start
        _layer.endPoint = end
        _layer.colors = cgColors
        _layer.locations = locations
    }

    public init(frame: CGRect,
                start: CGPoint = GradientDirection.bottom.startPoint,
                end: CGPoint = GradientDirection.bottom.endPoint,
                colors: [UIColor],
                locations: [NSNumber]? = nil)
    {
        _layer.frame = frame
        _layer.startPoint = start
        _layer.endPoint = end
        _layer.colors = colors.map { $0.cgColor }
        _layer.locations = locations
    }
    
    public init(frame: CGRect,
                direction: GradientDirection,
                cgColors: [CGColor],
                locations: [NSNumber]? = nil)
    {
        _layer.frame = frame
        _layer.startPoint = direction.startPoint
        _layer.endPoint = direction.endPoint
        _layer.colors = cgColors
        _layer.locations = locations
    }

    public init(frame: CGRect,
                direction: GradientDirection,
                colors: [UIColor],
                locations: [NSNumber]? = nil)
    {
        _layer.frame = frame
        _layer.startPoint = direction.startPoint
        _layer.endPoint = direction.endPoint
        _layer.colors = colors.map { $0.cgColor }
        _layer.locations = locations
    }
    
    // MARK: - Properties
    private var isChanged: Bool = true
    private var tempImage: UIImage?
    private let _layer: CAGradientLayer = CAGradientLayer()
    
    /// This property get CAGradientLayer Clone from CAGradientLayer
    public var layer: CAGradientLayer {
        let result = CAGradientLayer()
        result.frame = _layer.frame
        result.startPoint = _layer.startPoint
        result.endPoint = _layer.endPoint
        result.colors = _layer.colors
        result.locations = _layer.locations
        result.type = _layer.type
        return result
    }
    
    /// This property get frame from CAGradientLayer
    public var frame: CGRect {
        return _layer.frame
    }
    
    /// This property get Colors from CAGradientLayer
    public var colors: [CGColor] {
        guard let colors = _layer.colors as? [CGColor] else { return [] }
        return colors
    }
    
    /// This property get [NSNumber] from CAGradientLayer
    public var locations: [NSNumber]? {
        return _layer.locations
    }
    
    /// This property get CAGradientLayerType from CAGradientLayer
    public var type: CAGradientLayerType {
        return _layer.type
    }
    
    /// This property get UIImage from CAGradientLayer
    public var image: UIImage? {
        return isChanged || tempImage == nil ? generate() : tempImage
    }
    
    /// This property get UIColor from image in CAGradientLayer
    public var color: UIColor? {
        guard let img = image else { return nil }
        return UIColor(patternImage: img)
    }
    
    private func generate() -> UIImage? {
        var Gradient: UIImage?
        UIGraphicsBeginImageContext(_layer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            _layer.render(in: context)
            Gradient = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        tempImage = Gradient
        isChanged = false
        return tempImage
    }
    
    // MARK: - Public Methods
    
    /**
     # Set CAGradientLayer Frame
     - parameters:
        - frame: CGRect
     - returns: Gradient
     */
    @discardableResult
    public func setFrame(frame: CGRect) -> Gradient {
        _layer.frame = frame
        return didSetProperty()
    }
    
    /**
     # Set CAGradientLayer StartPoint and EndPoint
     - parameters:
        - direction: GradientDirection
     - returns: Gradient
     */
    @discardableResult
    public func setDirection(at direction: GradientDirection) -> Gradient {
        _layer.startPoint = direction.startPoint
        _layer.endPoint = direction.endPoint
        return didSetProperty()
    }
    
    /**
     # Set CAGradientLayer StartPoint
     - parameters:
        - start: CGPoint
     - returns: Gradient
     */
    @discardableResult
    public func setStart(at start: CGPoint) -> Gradient {
        _layer.startPoint = start
        return didSetProperty()
    }
    
    /**
     # Set CAGradientLayer EndPoint
     - parameters:
        - end: CGPoint
     - returns: Gradient
     */
    @discardableResult
    public func setEnd(at end: CGPoint) -> Gradient {
        _layer.endPoint = end
        return didSetProperty()
    }
    
    /**
     # Set CAGradientLayer Colors
     - parameters:
        - colors: [UIColor]
     - returns: Gradient
     */
    @discardableResult
    public func setColors(colors: [UIColor]) -> Gradient {
        return setColors(colors: colors.compactMap { $0.cgColor })
    }
    
    /**
     # Set CAGradientLayer Colors
     - parameters:
        - colors: [CGColor]
     - returns: Gradient
     */
    @discardableResult
    public func setColors(colors: [CGColor]) -> Gradient {
        _layer.colors = colors
        return didSetProperty()
    }
    
    /**
     # Set CAGradientLayer Locations
     - parameters:
        - locations: [NSNumber]
     - returns: Gradient
     */
    @discardableResult
    public func setLocations(locations: [NSNumber]) -> Gradient {
        _layer.locations = locations
        return didSetProperty()
    }
    
    /**
     # Set CAGradientLayer CAGradientLayerType
     - parameters:
        - type: CAGradientLayerType
     - returns: Gradient
     */
    @discardableResult
    public func setType(type: CAGradientLayerType) -> Gradient {
        _layer.type = type
        return didSetProperty()
    }
    
    private func didSetProperty() -> Gradient {
        isChanged = true
        return self
    }
}
#endif
