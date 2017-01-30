//
//  ViewController.swift
//  RxObjectMapper
//
//  Created by fmo91 on 01/30/2017.
//  Copyright (c) 2017 fmo91. All rights reserved.
//

import UIKit
import RxObjectMapper
import RxSwift
import RxCocoa
import ObjectMapper

struct Post: Mappable {
    var id: Int?
    var title: String = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
    }
}

class ViewController: UIViewController {
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        URLSession.shared
            .rx.json(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
            .mapArray(type: Post.self)
            .map { $0.map { $0.title } }
            .subscribe(
                onNext: { titles in
                    print("posts => \(titles)")
                },
                onError: { _ in
                    print("Error")
                }
            )
            .addDisposableTo(disposeBag)
        
        URLSession.shared
            .rx.json(url: URL(string: "https://jsonplaceholder.typicode.com/posts/1")!)
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

