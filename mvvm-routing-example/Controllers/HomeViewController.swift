//
//  HomeViewControllwe.swift
//  mvvm-routing-example
//
//  Created by Avijeet on 02/04/24.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    static func controller() -> HomeViewController {
        let router = HomeRouter()
        let viewModel = HomeViewModel(router: router)
        let vc = HomeViewController(viewModel: viewModel)
        router.controller = vc
        return vc
    }
    
    private let viewModel: HomeViewModel<HomeRouter>
    
    init(viewModel: HomeViewModel<HomeRouter>) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Coder not implemented")
    }
    
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Test", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    @objc func didTapButton() {
        viewModel.navigate(to: .editScreen(title: "Hello"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
