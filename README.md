# RxObjectMapper

[![CI Status](http://img.shields.io/travis/fmo91/RxObjectMapper.svg?style=flat)](https://travis-ci.org/fmo91/RxObjectMapper)
[![Version](https://img.shields.io/cocoapods/v/RxObjectMapper.svg?style=flat)](http://cocoapods.org/pods/RxObjectMapper)
[![License](https://img.shields.io/cocoapods/l/RxObjectMapper.svg?style=flat)](http://cocoapods.org/pods/RxObjectMapper)
[![Platform](https://img.shields.io/cocoapods/p/RxObjectMapper.svg?style=flat)](http://cocoapods.org/pods/RxObjectMapper)

## Introduction

RxObjectMapper is a set of extensions over `Observable<Element>` that transforms an `Observable<Any>` in `Observable<T>` or `Observable<[T]>` where T is `Mappable`.

## mapObject

`mapObject` transforms `Observable<Any>` into `Observable<T>` where T is `Mappable`.

```swift
let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!

URLSession.shared
.rx.json(url: url)
.mapObject(type: Post.self)
.subscribe(
onNext: { (post: Post) in
print("Post title => \(post.title)")
},
onError: { _ in
print("Error")
}
)
.addDisposableTo(disposeBag)
```

## mapArray

`mapArray` transforms `Observable<Any>` into `Observable<[T]>` where T is `Mappable`.

```swift
URLSession.shared
.rx.json(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
.mapArray(type: Post.self)
.subscribe(
onNext: { (posts: [Post]) in
// ...
},
onError: { _ in
print("Error")
}
)
.addDisposableTo(disposeBag)
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

RxObjectMapper relies on:

* RxSwift 3.0
* RxCocoa 3.0
* ObjectMapper 2.2
* Swift 3, of course.

## Installation

RxObjectMapper is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RxObjectMapper"
```

## Author

fmo91, ortizfernandomartin@gmail.com

## License

RxObjectMapper is available under the MIT license. See the LICENSE file for more info.
