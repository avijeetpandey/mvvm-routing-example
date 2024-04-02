//
//  NavigationRoutable.swift
//  mvvm-routing-example
//
//  Created by Avijeet on 02/04/24.
//

import UIKit

protocol NavigationRoutable {
    associatedtype RouterType
    
    var controller: UIViewController? { get }
    
    func navigate(to type: RouterType)
}

extension NavigationRoutable {
    func push(_ vc: UIViewController, animated: Bool = true) {
        controller?.navigationController?.pushViewController(vc, animated: animated)
    }
    
    func present(_ vc: UIViewController, animated: Bool = true) {
        controller?.present(vc, animated: animated)
    }
    
    func closeOrDismiss(animated: Bool = true) {
        if controller?.navigationController?.viewControllers.count ?? 0 > 1 {
            controller?.navigationController?.popViewController(animated: animated)
        } else {
            controller?.dismiss(animated: animated)
        }
    }
}
