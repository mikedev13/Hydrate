//
// HyrdateAnimationUIView.swift
// Generated by Core Animator version 1.5.2 on 1/26/18.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

import UIKit

private class _HyrdateAnimationUIPassthroughView: UIView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if subview.point(inside: convert(point, to: subview), with: event) { return true }
        }
        return false
    }
}

@IBDesignable
class HyrdateAnimationUIView : UIView, CAAnimationDelegate {


	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
	var viewsByName: [String : UIView]!

	// - MARK: Life Cycle

	convenience init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 1500, height: 1500))
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupHierarchy()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupHierarchy()
	}

	// - MARK: Scaling

	override func layoutSubviews() {
		super.layoutSubviews()

		if let scalingView = self.viewsByName["__scaling__"] {
			var xScale = self.bounds.size.width / scalingView.bounds.size.width
			var yScale = self.bounds.size.height / scalingView.bounds.size.height
			switch contentMode {
			case .scaleToFill:
				break
			case .scaleAspectFill:
				let scale = max(xScale, yScale)
				xScale = scale
				yScale = scale
			default:
				let scale = min(xScale, yScale)
				xScale = scale
				yScale = scale
			}
			scalingView.transform = CGAffineTransform(scaleX: xScale, y: yScale)
			scalingView.center = CGPoint(x:self.bounds.midX, y:self.bounds.midY)
		}
	}

	// - MARK: Setup

	func setupHierarchy() {
		var viewsByName: [String : UIView] = [:]
		let bundle = Bundle(for:type(of: self))
		let __scaling__ = UIView()
		__scaling__.bounds = CGRect(x:0, y:0, width:1500, height:1500)
		__scaling__.center = CGPoint(x:750.0, y:750.0)
		__scaling__.clipsToBounds = true
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let negative__root = _HyrdateAnimationUIPassthroughView()
		let negative__xScale = _HyrdateAnimationUIPassthroughView()
		let negative__yScale = _HyrdateAnimationUIPassthroughView()
		let negative = UIImageView()
		let imgNegative = UIImage(named:"negative.png", in: bundle, compatibleWith: nil)
		if imgNegative == nil {
			print("** Warning: Could not create image from 'negative.png'")
		}
		negative.image = imgNegative
		negative.contentMode = .center
		negative.bounds = CGRect(x:0, y:0, width:256.0, height:256.0)
		negative__root.layer.position = CGPoint(x:750.000, y:750.000)
		negative__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		negative__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		negative__root.transform = CGAffineTransform(rotationAngle: 0.000)
		negative__root.addSubview(negative__xScale)
		negative__xScale.addSubview(negative__yScale)
		negative__yScale.addSubview(negative)
		__scaling__.addSubview(negative__root)
		viewsByName["negative__root"] = negative__root
		viewsByName["negative__xScale"] = negative__xScale
		viewsByName["negative__yScale"] = negative__yScale
		viewsByName["negative"] = negative

		self.viewsByName = viewsByName
	}

	// - MARK: Spin1

	func addSpin1Animation() {
		addSpin1Animation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addSpin1Animation(completion: ((Bool) -> Void)?) {
		addSpin1Animation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addSpin1Animation(removedOnCompletion: Bool) {
		addSpin1Animation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addSpin1Animation(removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addSpin1Animation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addSpin1Animation(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 1.000
			representativeAnimation.delegate = self
			self.layer.add(representativeAnimation, forKey: "Spin1")
			self.animationCompletions[layer.animation(forKey: "Spin1")!] = complete
		}

		let negativeRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		negativeRotationAnimation.duration = 1.000
		negativeRotationAnimation.values = [0.000, 6.283] as [Float]
		negativeRotationAnimation.keyTimes = [0.000, 1.000] as [NSNumber]
		negativeRotationAnimation.timingFunctions = [linearTiming]
		negativeRotationAnimation.beginTime = beginTime
		negativeRotationAnimation.fillMode = fillMode
		negativeRotationAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["negative__root"]?.layer.add(negativeRotationAnimation, forKey:"Spin1_Rotation")

		let negativeOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		negativeOpacityAnimation.duration = 1.000
		negativeOpacityAnimation.values = [1.000, 0.000] as [Float]
		negativeOpacityAnimation.keyTimes = [0.000, 1.000] as [NSNumber]
		negativeOpacityAnimation.timingFunctions = [linearTiming]
		negativeOpacityAnimation.beginTime = beginTime
		negativeOpacityAnimation.fillMode = fillMode
		negativeOpacityAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["negative__root"]?.layer.add(negativeOpacityAnimation, forKey:"Spin1_Opacity")
	}

	func removeSpin1Animation() {
		self.layer.removeAnimation(forKey: "Spin1")
		self.viewsByName["negative__root"]?.layer.removeAnimation(forKey: "Spin1_Rotation")
		self.viewsByName["negative__root"]?.layer.removeAnimation(forKey: "Spin1_Opacity")
	}

	// MARK: CAAnimationDelegate
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		if let completion = self.animationCompletions[anim] {
			self.animationCompletions.removeValue(forKey: anim)
			completion(flag)
		}
	}

	func removeAllAnimations() {
		for subview in viewsByName.values {
			subview.layer.removeAllAnimations()
		}
		self.layer.removeAnimation(forKey: "Spin1")
	}
}