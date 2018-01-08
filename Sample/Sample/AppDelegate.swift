//
//  AppDelegate.swift
//  Sample
//
//  Created by 李二狗 on 2018/1/8.
//  Copyright © 2018年 Meniny Lab. All rights reserved.
//

import Cocoa
import SortAlgorithm

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        let original = [Int].init(repeating: 0, count: 5000).map { $0 + Int(arc4random_uniform(5000)) }
        let closure: Array<Int>.SortingCompareClosure = { (l, r) -> Bool in
            return l < r
        }
        
        print("Bubble: \n\(original.bubbleSort(by: closure))")
        print("\n\n======\n\n")
        print("Insertion: \n\(original.insertionSort(by: closure))")
        print("\n\n======\n\n")
        print("Merge: \n\(original.mergeSort(by: closure))")
        print("\n\n======\n\n")
        print("Quick: \n\(original.quickSort(by: closure))")
        print("\n\n======\n\n")
        print("Counting: \n\(original.countingSort())")
        print("\n\n======\n\n")
        print("Heap: \n\(original.heapSort(by: closure))")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

