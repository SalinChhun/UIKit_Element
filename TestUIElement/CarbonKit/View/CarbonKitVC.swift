//
//  CarbonKitVC.swift
//  TestUIElement
//
//  Created by SalinChhun on 16/12/23.
//

import UIKit
import CarbonKit

class CarbonKitVC: UIViewController {
    
    // MARK:  - Register VC to carbon kit -
    let collectionStoryboard    = UIStoryboard(name: "CollectionSB", bundle: Bundle(identifier: "CollectionVC"))
    let segmentStoryboard    = UIStoryboard(name: "SegmentSB", bundle: Bundle(identifier: "SegmentVC"))
    
    // MARK:  - Carbon kit properties -
    var controllerName       = ["Home", "Info", "Saved"]
    var carbonSwapNavigation = CarbonTabSwipeNavigation()
    var selectedIndex  = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        carbonSwapNavigation = CarbonTabSwipeNavigation(items: controllerName, delegate: self)
        carbonSwapNavigation.insert(intoRootViewController: self)
        carbonSwapNavigation.carbonSegmentedControl?.backgroundColor = #colorLiteral(red: 0.9511644244, green: 0.9611126781, blue: 0.9695445895, alpha: 1)
        carbonSwapNavigation.setTabBarHeight(40)
        carbonSwapNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 3, forSegmentAt: 0)
        carbonSwapNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 3, forSegmentAt: 1)
        carbonSwapNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 3, forSegmentAt: 2)
        carbonSwapNavigation.setNormalColor(UIColor.black, font: UIFont.systemFont(ofSize: 19))
        carbonSwapNavigation.setSelectedColor(#colorLiteral(red: 0.437166661, green: 0.06278865784, blue: 0.8730230927, alpha: 1), font: UIFont.systemFont(ofSize: 19, weight: .bold))
        carbonSwapNavigation.setIndicatorColor(#colorLiteral(red: 0.437166661, green: 0.06278865784, blue: 0.8730230927, alpha: 1))
        carbonSwapNavigation.setIndicatorHeight(1)
        carbonSwapNavigation.currentTabIndex = UInt(selectedIndex)
    }
    
    private func switchToTab(index: UInt) {
        carbonSwapNavigation.setCurrentTabIndex(index, withAnimation: true)
    }

}

extension CarbonKitVC: CarbonTabSwipeNavigationDelegate {
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        guard let storyboard = storyboard else {
            return UIViewController()
        }
        if index == 0 {
            return collectionStoryboard.instantiateViewController(withIdentifier: "CollectionVC")
        } else if index == 1 {
            return segmentStoryboard.instantiateViewController(withIdentifier: "SegmentVC")
        }
        else if index == 2 {
            return collectionStoryboard.instantiateViewController(withIdentifier: "CollectionVC")
        } else {
            return collectionStoryboard.instantiateViewController(withIdentifier: "CollectionVC")
        }
    }
    
    
}
