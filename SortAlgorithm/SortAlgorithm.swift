//
//  Algorithm.swift
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
    /// Sort Compare closure
    public typealias SortingCompareClosure = (Element, Element) -> Bool
}

public extension Array where Element: Comparable {
    
    // MARK: - 冒泡排序
    /// Bubble Sort
    ///
    /// - Parameter compare: Compare closure
    /// - Returns: Sorted Array
    public func bubbleSort(by compare: Array.SortingCompareClosure) -> [Element] {
        guard self.count > 1 else {
            return self
        }
        var items = self
        let count = items.count
        for i in 0..<count-1 {
            var j = count - 1
            while j > i {
                if !compare(items[j-1], items[j]) {
                    (items[j-1], items[j]) = (items[j], items[j-1])
                }
                j-=1
            }
        }
        return items
    }

    // MAKR: - 插入排序
    /// Insertion Sort
    ///
    /// - Parameter compare: Compare closure
    /// - Returns: Sorted Array
    public func insertionSort(by compare: Array.SortingCompareClosure) -> [Element] {
        guard self.count > 1 else {
            return self
        }
        var items = self
        let count = items.count
        for i in 1..<count {
            let key = items[i]
            var j = i - 1
            while j >= 0 && !compare(items[j], key) {
                items[j+1] = items[j]
                j-=1
            }
            items[j+1] = key
        }
        return items
    }

    // MARK: - 归并排序
    /// Merge Sort
    ///
    /// - Parameter compare: Compare closure
    /// - Returns: Sorted Array
    public func mergeSort(by compare: Array.SortingCompareClosure) -> [Element] {

        func internal_merge(left: [Element], right: [Element], by compare: Array.SortingCompareClosure) -> [Element] {
            var result = [Element]()
            var l = 0, r = 0
            while l < left.count || r < right.count {
                if r == right.count || (l < left.count && compare(left[l], right[r])) {
                    result.append(left[l])
                    l+=1
                } else {
                    result.append(right[r])
                    r+=1
                }
            }
            return result
        }

        var items = self
        if items.count < 2 {
            return items
        } else if items.count == 2 {
            if !compare(items[0], items[1]) {
                (items[0], items[1]) = (items[1], items[0])
            }
            return items
        } else {
            let middle = items.count/2
            let left = Array(items[0..<middle]).mergeSort(by: compare)
            let right = Array(items[middle..<items.count]).mergeSort(by: compare)
            return internal_merge(left: left, right: right, by: compare)
        }
    }

    // MARK: - 快速排序
    /// Quick Sort
    ///
    /// - Parameter compare: Compare closure
    /// - Returns: Sorted Array
    public func quickSort(by compare: Array.SortingCompareClosure) -> [Element] {
        guard self.count > 1 else {
            return self
        }
        var items = self

        func internal_partition(_ items: inout [Element], left: Int, right: Int, by compare: Array.SortingCompareClosure) -> Int {
            let random = left + Int(arc4random_uniform(UInt32(right-left)))
            let key = items[random]
            (items[left], items[random]) = (items[random], items[left])
            var j = left
            for i in (left+1)...right {
                if compare(items[i], key) {
                    j+=1
                    if i != j {
                        (items[i], items[j]) = (items[j], items[i])
                    }
                }
            }
            (items[left], items[j]) = (items[j], items[left])
            return j
        }

        func internal_quickSort(_ items: inout [Element], left: Int, right: Int, by compare: Array.SortingCompareClosure) {
            if left < right {
                let middle = internal_partition(&items, left: left, right: right, by: compare)
                internal_quickSort(&items, left: left, right: middle-1, by: compare)
                internal_quickSort(&items, left: middle+1, right: right, by: compare)
            }
        }

        internal_quickSort(&items, left: 0, right: items.count-1, by: compare)
        return items
    }
}
