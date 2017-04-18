//
//  ViewController.swift
//  StrydOnboardDemo
//
//  Created by Qi Liu on 4/18/17.
//  Copyright © 2017 wei. All rights reserved.
//

import UIKit
import BWWalkthrough

class ViewController: UIViewController, BWWalkthroughViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showHelpOnboard(_ sender: UIButton) {
        // Get view controllers and build the walkthrough
        let stb = UIStoryboard(name: "Onboard", bundle: nil)
        let walkthrough = stb.instantiateViewController(withIdentifier: "helpContainer") as! BWWalkthroughViewController
        let page_1 = stb.instantiateViewController(withIdentifier: "configureStryd")
        let page_2 = stb.instantiateViewController(withIdentifier: "upgradeFirmware")
        let page_3 = stb.instantiateViewController(withIdentifier: "howToUse")
        let page_4 = stb.instantiateViewController(withIdentifier: "runningWithStryd")
        let page_5 = stb.instantiateViewController(withIdentifier: "pairWatch")
        
        // Attach the pages to the master
        walkthrough.delegate = self
        walkthrough.add(viewController:page_1)
        walkthrough.add(viewController:page_2)
        walkthrough.add(viewController:page_3)
        walkthrough.add(viewController:page_4)
        walkthrough.add(viewController:page_5)
        
        self.present(walkthrough, animated: true, completion: nil)

    }
    
    // MARK: - Walkthrough delegate -
    
    func walkthroughPageDidChange(_ pageNumber: Int) {
        print("Current Page \(pageNumber)")
    }
    
    func walkthroughCloseButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

