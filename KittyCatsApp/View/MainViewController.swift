//
//  ViewController.swift
//  KittyCatsApp
//
//  Created by Sabina Huseynova on 26.10.21.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

class MainViewController: UIViewController {

    var mainTableView: UITableView!

    var catModels = BehaviorRelay<[ObservableViewModel.CatViewModel]>(value: [])
    var observableViewModel = ObservableViewModel()
    let disposeBag = DisposeBag()
    var callTimer: Timer?


    override func viewDidLoad() {
        super.viewDidLoad()
        observableViewModel.observableFetch()
        timeInterval()
        setupMainTableView()
        setupBindings()
        setupMainCell()
        
    }

    func setupBindings() {
        observableViewModel
            .catModels
            .observe(on: MainScheduler.instance)
            .bind(to: self.catModels)
            .disposed(by: disposeBag)
}
    
    func setupMainTableView() {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        mainTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        mainTableView.rowHeight = 150
        mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        self.view.addSubview(mainTableView)
        mainTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.mainTableView.keyboardDismissMode = .onDrag
        
    }
//    MARK: - Timer fetching
    func timeInterval() {
        callTimer = Timer.scheduledTimer(timeInterval: 20, target: self, selector: #selector(timeToCall), userInfo: nil, repeats: true)
    }
    
    @objc func timeToCall() {
        observableViewModel.observableFetch()
    }
    
//    MARK: - Rx Setup
    
    func setupMainCell() {
        
            catModels
            .observe(on: MainScheduler.instance)
            .bind(to: mainTableView
                    .rx
                    .items(cellIdentifier: "MainTableViewCell",
                           cellType: MainTableViewCell.self)) { row, cat, cell in
                if let url = cat.url {
                    if let cellUrl = URL(string: url) {
                        cell.productImage.kf.setImage(with: cellUrl)
                    }
                    if let name = cat.name {
                        cell.productNameLabel.text = "\(name)"
                        
                    }
        
                }
    
            }
                           .disposed(by: disposeBag)
    }
}
