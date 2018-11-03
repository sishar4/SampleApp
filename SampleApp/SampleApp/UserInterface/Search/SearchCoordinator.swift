//
//  SearchCoordinator.swift
//  SampleApp
//
//  Created by Sahil Ishar on 11/3/18.
//  Copyright © 2018 Sahil Ishar. All rights reserved.
//

import UIKit

class SearchCoordinator {

    var navigationController: UINavigationController?
    
    func start(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        let searchVC = SearchViewController()
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
}
