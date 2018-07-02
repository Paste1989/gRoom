//
//  GRContactsViewController.swift
//  GrApp
//
//  Created by Saša Brezovac on 14/06/2018.
//  Copyright © 2018 CopyPaste89. All rights reserved.
//

import UIKit

class GRContactsViewController: UIViewController {

    var myGreenColor = UIColor(hex: 0x1DA84D)
    
    //MARK: - Outlets
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        navigationController?.navigationBar.topItem?.title = "Contacts"
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
    
    func openUrl(urlStr:String!) {
        
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func locationButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GRMapViewController") as! GRMapViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    @IBAction func grRoomPageButtonPressed(_ sender: Any) {
        openUrl(urlStr: "https://www.google.com/?client=safari&channel=mac_bm")
    }
    
    
    @IBAction func grEmailButtonPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "mailto:myEmail@gmail.com")! as URL, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func sendMessageButtonPressed(_ sender: Any) {
        openUrl(urlStr: "https://www.google.com/?client=safari&channel=mac_bm")
    }
    
}
