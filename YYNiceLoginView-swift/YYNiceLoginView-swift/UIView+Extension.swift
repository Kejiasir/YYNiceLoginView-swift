//
//  UIView+Extension.swift
//  YYNiceLoginView-swift
//
//  Created by Arvin on 16/10/30.
//  Copyright © 2016年 Arvin. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /// 控件x值
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    /// 控件y值
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    /// 控件宽度
    public var w: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    /// 控件高度
    public var h: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    /// 控件中心x值
    public var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    /// 控件中心y值
    public var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    /// 控件坐标原点
    public var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.x = newValue.x
            self.y = newValue.y
        }
    }
    
    /// 控件尺寸
    public var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.w = newValue.width
            self.h = newValue.height
        }
    }
    
    /// 控件最大x值
    public var maxX: CGFloat {
        get {
            return self.x + self.w
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue - frame.size.width
            frame = self.frame
        }
    }
    
    /// 控件最大y值
    public var maxY: CGFloat {
        get {
            return self.y + self.h
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue - frame.size.height
            frame = self.frame
        }
    }
}

