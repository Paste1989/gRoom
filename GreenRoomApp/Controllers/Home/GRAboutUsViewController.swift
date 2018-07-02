//
//  aboutUsViewController.swift
//  GrApp
//
//  Created by Saša Brezovac on 14/06/2018.
//  Copyright © 2018 CopyPaste89. All rights reserved.
//

import UIKit

class GRAboutUsViewController: UIViewController {

    var myGreenColor = UIColor(hex: 0x1DA84D)
    
    //MARK: - Outlets
    @IBOutlet weak var aboutUsLabel: UILabel!
    
    
    
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let string = aboutUsLabel.text!
        if string.contains("#") == true {
            let text: NSString = aboutUsLabel.text! as NSString
            let words = text.components(separatedBy: " ").filter { $0.hasPrefix("#") }
            let attributed = NSMutableAttributedString(string: text as String)
            for word in words {
                attributed.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(hex: 0xE74C68), range: text.range(of: word))
            }
            aboutUsLabel.attributedText = attributed
        }
        
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let backButtonImage = UIImage(named: "backSignWh")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationController?.navigationBar.topItem?.title = "gr"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        if UIScreen.main.bounds.size.height == 812 {
            let image = UIImage(named: "navImage")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
        else {
            let image = UIImage(named: "nBarImage2")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "About us"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        if UIScreen.main.bounds.size.height == 812 {
            let image = UIImage(named: "navImage")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
        else {
            let image = UIImage(named: "nBarImage2")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Actions
    @objc func goBack(){
        navigationController?.popViewController(animated: true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

}
