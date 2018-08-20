//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Sahil Ishar on 8/19/18.
//  Copyright © 2018 Sahil Ishar. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var cityStateTF: UITextField!
    @IBOutlet weak var zipCodeTF: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    var presenter: SearchPresenter = SearchPresenter()
    
    @IBAction func searchClicked(_ sender: Any) {
        
        if isValidSearch() {
            errorLabel.isHidden = false
            return
        }
        
        // Call search api
        self.presenter.search(cityStateTF.text, zip: zipCodeTF.text) { [unowned self] (groups, error) in
            
            if let err = error {
                print("Error: \(err.networkErrorMessage.rawValue)")
                let alertController = UIAlertController(title: "Search Failed", message: err.networkErrorMessage.rawValue, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
            else {
                //Go to next screen with results
            }
        }
    }
    
    func isValidSearch() -> Bool {
        
        if self.cityStateTF.text?.isEmpty ?? true && self.zipCodeTF.text?.isEmpty ?? true {
            return false
        }
        
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        errorLabel.text = Constants.searchFormErrorLabel
        errorLabel.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
