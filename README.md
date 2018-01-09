
<p align="center">
  <!-- <img src="https://i.loli.net/2018/01/05/5a4f153d36a21.png" alt="SortAlgorithm"> -->
  <br/><a href="https://cocoapods.org/pods/SortAlgorithm">
  <img alt="Version" src="https://img.shields.io/badge/version-1.1.1-brightgreen.svg">
  <img alt="Author" src="https://img.shields.io/badge/author-Meniny-blue.svg">
  <img alt="Build Passing" src="https://img.shields.io/badge/build-passing-brightgreen.svg">
  <img alt="Swift" src="https://img.shields.io/badge/swift-4.0%2B-orange.svg">
  <br/>
  <img alt="Platforms" src="https://img.shields.io/badge/platform-macOS%20%7C%20iOS%20%7C%20watchOS%20%7C%20tvOS-lightgrey.svg">
  <img alt="MIT" src="https://img.shields.io/badge/license-MIT-blue.svg">
  <br/>
  <img alt="Cocoapods" src="https://img.shields.io/badge/cocoapods-compatible-brightgreen.svg">
  <img alt="Carthage" src="https://img.shields.io/badge/carthage-working%20on-red.svg">
  <img alt="SPM" src="https://img.shields.io/badge/swift%20package%20manager-compatible-brightgreen.svg">
  </a>
</p>

# Introduction

## What's this?

`SortAlgorithm` is a Swift array sort algorithm framework.

## Requirements

* iOS 8.0+
* tvOS 9.0+
* macOS 10.9+
* watchOS 2.0+
* Xcode 9 with Swift 4

## Installation

#### CocoaPods

```ruby
pod 'SortAlgorithm'
```

## Contribution

You are welcome to fork and submit pull requests.

## License

`SortAlgorithm` is open-sourced software, licensed under the `MIT` license.

## Sample

```swift
// Randome Array
let original = [Int].init(repeating: 0, count: 5000).map { $0 + Int(arc4random_uniform(5000)) }
let closure: Array<Int>.SortingCompareClosure = { (l, r) -> Bool in
    return l < r
}
// Now sort
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
```
