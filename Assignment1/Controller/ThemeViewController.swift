//
//  ThemeViewController.swift
//  Assignment1
//
//  Created by Adham Ragab on 2/16/20.
//  Copyright © 2020 Adham Ragab. All rights reserved.
//

import UIKit

class ThemeViewController: UIViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    
    
    // if the vc segued to != nil continue the game u were playing
    // else use segue to create a new game
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let vc = secondaryViewController as? ViewController {
            if vc.theme == nil {
                return true
            }
        }
        return false
    }
    
     // MARK: - Choose Theme
    //continue the game u were playing using navigation conroller.pushviewController
    
    @IBAction func ThemePressed(_ sender: Any) {
        if let vc = splitViewDetailConcentrationViewController {
            if let theme = (sender as? UIButton)?.currentTitle {
                vc.theme = theme
            }
        }else if let vc = lastSeguedConcentrationViewController{
            if let theme = (sender as? UIButton)?.currentTitle {
                         vc.theme = theme
                     }
            navigationController?.pushViewController(vc, animated: true)
        }else {
        performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
    
    private var splitViewDetailConcentrationViewController : ViewController? {
        return splitViewController?.viewControllers.last as? ViewController
    }
    
    var lastSeguedConcentrationViewController : ViewController?
   

    // MARK: - Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme"{
            if let theme = (sender as? UIButton)?.currentTitle {
                if let vc = segue.destination as? ViewController {
                    vc.theme = theme
                    lastSeguedConcentrationViewController = vc
                }
            }
        }
    }
  
}
