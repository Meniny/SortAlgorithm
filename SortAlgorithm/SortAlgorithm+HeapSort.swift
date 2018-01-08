//
//  Algorithm+HeapSort.swift
//  Meniny Lab
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  No more shall we pray for peace
//  Never ever ask them why
//  No more shall we stop their visions
//  Of selfdestructing genocide
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  Screams of terror, panic spreads
//  Bombs are raining from the sky
//  Bodies burning, all is dead
//  There's no place left to hide
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  (A voice was heard from the battle field)
//
//  "Couldn't care less for a last goodbye
//  For as I die, so do all my enemies
//  There's no tomorrow, and no more today
//  So let us all fade away..."
//
//  Upon this ball of dirt we lived
//  Darkened clouds now to dwell
//  Wasted years of man's creation
//  The final silence now can tell
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  When I wrote this code, only I and God knew what it was.
//  Now, only God knows!
//
//  So if you're done trying 'optimize' this routine (and failed),
//  please increment the following counter
//  as a warning to the next guy:
//
//  total_hours_wasted_here = 0
//
//  Created by Elias Abel on 2017/1/5.
//  Copyright © 2017 MobiMagic. All rights reserved.
//

public extension Array where Element: Comparable {
    // MAKR: - 堆排序
    /// Heap Sort
    ///
    /// - Parameter compare: Compare closure
    /// - Returns: Sorted Array
    public func heapSort(by compare: Array.SortingCompareClosure) -> [Element] {
        guard self.count > 1 else {
            return self
        }
        var heap = MaxHeap(items: self), i = self.count - 1
        while i > 0 {
            (heap.items[0], heap.items[i]) = (heap.items[i], heap.items[0])
            heap.heapSize -= 1
            heap.maxHeapify(0)
            i -= 1
        }
        return heap.items
    }
}

// MAKR: - HeapSort Helper

public protocol HeapType {
    associatedtype T
    var items: [T] { get set }
    var heapSize: Int { get set }
    func parent(_ i: Int) -> Int
    func left(_ i: Int) -> Int
    func right(_ i: Int) -> Int
}

public extension HeapType {
    public func parent(_ i: Int) -> Int {
        return i/2
    }
    
    public func left(_ i: Int) -> Int {
        return i*2
    }
    
    public func right(_ i: Int) -> Int {
        return i*2 + 1
    }
}

public struct MaxHeap<T: Comparable>: HeapType {
    public var items: [T]
    public var heapSize: Int
    
    public mutating func maxHeapify(_ i: Int) {
        let l = left(i), r = right(i)
        var largest = -1
        if l < heapSize && items[l] > items[i] {
            largest = l
        } else {
            largest = i
        }
        if r < heapSize && items[r] > items[largest] {
            largest = r
        }
        if largest != i {
            (items[largest], items[i]) = (items[i], items[largest])
            maxHeapify(largest)
        }
    }
    
    public init(items: [T]) {
        self.items = items
        heapSize = items.count
        var i = items.count/2
        while i >= 0 {
            maxHeapify(i)
            i-=1
        }
    }
}

public struct MinHeap<T: Comparable>: HeapType {
    public var items: [T]
    public var heapSize: Int
    
    public mutating func minHeapify(_ i: Int) {
        let l = left(i), r = right(i)
        var smallest = -1
        if l < heapSize && items[l] < items[i] {
            smallest = l
        } else {
            smallest = i
        }
        if r < heapSize && items[r] < items[smallest] {
            smallest = r
        }
        if smallest != i {
            (items[smallest], items[i]) = (items[i], items[smallest])
            minHeapify(smallest)
        }
    }
    
    public init(items: [T]) {
        self.items = items
        heapSize = items.count
        var i = items.count/2
        while i >= 0 {
            minHeapify(i)
            i-=1
        }
    }
}
