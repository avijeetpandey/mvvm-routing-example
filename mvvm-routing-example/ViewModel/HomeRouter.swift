//
//  HomeRouter.swift
//  mvvm-routing-example
//
//  Created by Avijeet on 02/04/24.
//

import UIKit

class HomeRouter: NavigationRoutable {
    var controller: UIViewController?
    
    func navigate(to type: HomeRouterType) {
        switch type {
        case  .help,
                .share:
            break
        case .editScreen(title: let title):
            let vc = EditScreenController()
            vc.title = title
            push(vc)
        }
    }
}


enum HomeRouterType {
    case editScreen(title: String)
    case help
    case share
}
