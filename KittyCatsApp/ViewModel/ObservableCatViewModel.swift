//
//  CatViewModel.swift
//  KittyCatsApp
//
//  Created by Sabina Huseynova on 26.10.21.
//

import Foundation
import RxCocoa
import RxSwift

class ObservableCatViewModel{
    
    static let shared = ObservableCatViewModel()
    public var catModels = BehaviorRelay<[CatViewModel]>(value: [])
    
    struct CatViewModel {
        
        var breeds: [CatBreeds]?
        var id, url: String?
        var width, height: Int?
        var name: String?
        
        init(catModel: CatModel) {
            if let arrayBreeds = catModel.breeds {
                self.breeds = arrayBreeds
                for name in arrayBreeds {
                    self.name = name.name
                }
            }
            self.id = catModel.id
            self.url = catModel.url
            self.width = catModel.width
            self.height = catModel.height
        }
    }
    
    func fetchCats() -> Observable<[CatViewModel]> {
        return Observable.create { observer in
            Service.shared.fetchData(){ result, err in
                let newArray = result.map({return CatViewModel(catModel: $0)})
                observer.onNext(newArray)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    
}
