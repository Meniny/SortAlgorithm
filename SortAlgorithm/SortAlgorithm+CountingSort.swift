//
//  Algorithm+CountingSort.swift
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

public extension Array where Element == Int {
    // MAKR: - 计数排序
    /// Counting Sort
    ///
    /// - Returns: Sorted Array
    public func countingSort() -> [Element] {
        guard self.count > 1 else {
            return self
        }
        // Step 1
        // Create an array to store the count of each element
        let maxElement = self.max() ?? 0
        
        var countArray = [Element](repeating: 0, count: maxElement + 1)
        for element in self {
            countArray[element] += 1
        }
        
        // Step 2
        // Set each value to be the sum of the previous two values
        for index in 1 ..< countArray.count {
            let sum = countArray[index] + countArray[index - 1]
            countArray[index] = sum
        }
        
        // Step 3
        // Place the element in the final array as per the number of elements before it
        var sortedArray = [Element](repeating: 0, count: self.count)
        for element in self {
            countArray[element] -= 1
            sortedArray[countArray[element]] = element
        }
        return sortedArray
    }
}
