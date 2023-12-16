//
//  SegmentVC.swift
//  TestUIElement
//
//  Created by SalinChhun on 16/12/23.
//

import UIKit

class SegmentVC: UIViewController {

    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var customView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.backgroundColor = .blue
        segmentController.backgroundColor = .blue
    }
    
    @IBAction func segmentTapped(_ sender: Any) {
        switch segmentController.selectedSegmentIndex {
            case 0:
                customView.backgroundColor = .blue
                segmentController.backgroundColor = .blue
            case 1:
                customView.backgroundColor = .red
                segmentController.backgroundColor = .red
            case 2:
                customView.backgroundColor = .cyan
                segmentController.backgroundColor = .cyan
            default:
                break
        }
    }
    

}
