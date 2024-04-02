//
//  HomeViewModel.swift
//  mvvm-routing-example
//
//  Created by Avijeet on 02/04/24.
//

import Foundation

class HomeViewModel<R: NavigationRoutable> {
    private let router: R
    
    init(router: R) {
        self.router = router
    }
    
    func navigate(to type: R.RouterType) {
        router.navigate(to: type)
    }
}
