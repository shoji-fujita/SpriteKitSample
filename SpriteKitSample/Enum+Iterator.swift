//
//  Enum+Iterator.swift
//  SpriteKitSample
//
//  Created by shoji on 2017/03/07.
//  Copyright © 2017年 shoji fujita. All rights reserved.
//

public protocol EnumEnumerable {
    associatedtype Element = Self
}

public extension EnumEnumerable where Element: Hashable {
    private static var iterator: AnyIterator<Element> {
        var n = 0
        return AnyIterator {
            defer { n += 1 }
            
            let next = withUnsafePointer(to: &n) {
                UnsafeRawPointer($0).assumingMemoryBound(to: Element.self).pointee
            }
            return next.hashValue == n ? next : nil
        }
    }
    
    public static var elements: [Element] {
        return Array(self.iterator)
    }
}
