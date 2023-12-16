//
//  DetailsVC.swift
//  TestUIElement
//
//  Created by SalinChhun on 15/12/23.
//

import UIKit

class DetailsVC: UIViewController {

    var name: String?
    var image: String?
    var gender: String?
    var age: Int?
    var role: String?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var genderView: UILabel!
    @IBOutlet weak var ageView: UILabel!
    @IBOutlet weak var position: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: image!)
        nameView.text = name
        genderView.text = gender
        position.text = role
        if let ageValue = age {
            ageView.text = String(ageValue)
        } else {
            // Handle the case when age is nil
            ageView.text = "N/A"
        }
        
    }
    
}
