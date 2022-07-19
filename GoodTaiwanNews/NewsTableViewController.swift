//
//  NewsTableViewController.swift
//  GoodTaiwanNews
//
//  Created by Flow_RyanChou on 2022/7/18.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    
    let disposBag = DisposeBag()
    
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
        
    }
    
    private func populateNews(){
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=42678638c9514b2cba614b69032aaaa2")!
        
        Observable.just(url)
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            }
            .map { data -> [Article]? in
                return try? JSONDecoder().decode(ArticalList.self, from: data).articles
            }
            .subscribe(onNext: { [weak self] articles in
                
                if let articles = articles {
                    self?.articles = articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            })
            .disposed(by: disposBag)
        
    }
}
