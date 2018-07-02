//
//  SingleArtistInfoViewController.swift
//  GrApp
//
//  Created by Saša Brezovac on 14/06/2018.
//  Copyright © 2018 CopyPaste89. All rights reserved.
//

import UIKit
import AVFoundation



class GRDetailArtistViewController: UIViewController {
    
    var getName: String!
    var getPicture: UIImage!
    var getPlace: String!
    
    var recivedFbPage:String!
    var getFb: String!
    
    var recivedInstagramPage: String!
    var getInsta: String!
    
    var recivedInternetPage: String!
    var getIntPage: String!

    
    var moreDetails: Bool!
    
    var artists = [Artist]()
    var filteredArtists = [Artist]()
    
    
    
    var myGreenColor = UIColor(hex: 0x1DA84D)
    
    
    
    //MARK: - Outlets
    @IBOutlet weak var coverimage: UIImageView!
    
    @IBOutlet weak var recivedImage: UIImageView!
    @IBOutlet weak var recivedText: UILabel!
    @IBOutlet weak var recivedPlace: UILabel!
    
    
    
    @IBOutlet weak var moreDetailsLabel: UILabel!

    @IBOutlet weak var textLabelView: UIView!
    
    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var instagramButton: UIButton!
    @IBOutlet weak var internetButton: UIButton!
    
    
    
    @IBOutlet weak var coverImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var greenCirHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var greenCirWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var greenCirBottomConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var profileImageheightConstraint: NSLayoutConstraint!
    @IBOutlet weak var profileImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var whiteViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var whiteViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var artistLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var placeLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var artistLabelTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var moreDetailsLabelHeightConstraint: NSLayoutConstraint!
   
    @IBOutlet weak var fbButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var fbLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var internetButtonTrailingConstraint: NSLayoutConstraint!
    
    
    
    //ARTISTdetails
    var a: String = "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    
    var b: String = "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    
    var c: String = "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    
    var d: String = "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    
    var e: String = "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    
    var f: String = "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    
    var g: String = "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    
    var h: String = "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    
    var i: String = "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    
    var j: String = "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreDetails = false

        recivedImage.image = getPicture
        recivedText.text = getName
        recivedPlace.text = getPlace
        recivedFbPage = getFb
        recivedInstagramPage = getInsta
        recivedInternetPage = getIntPage
        print("recivedInternet: \(recivedInternetPage)")
        
        getDetails()
        
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
        else if UIScreen.main.bounds.size.height == 667 {
            coverImageHeightConstraint.constant = 150
            greenCirHeightConstraint.constant = 150
            greenCirWidthConstraint.constant = 150
            greenCirBottomConstraint.constant = -70
            
            profileImageheightConstraint.constant = 115
            profileImageWidthConstraint.constant = 115
            
            whiteViewHeightConstraint.constant =  130
            whiteViewTopConstraint.constant = -40
            
            artistLabelHeightConstraint.constant = 30
            artistLabelTopConstraint.constant = 10
            
            placeLabelHeightConstraint.constant = 20
            
            recivedText.font = recivedText.font.withSize(20)
            recivedPlace.font = recivedPlace.font.withSize(15)
            
            moreDetailsLabelHeightConstraint.constant = 250
            moreDetailsLabel.font = moreDetailsLabel.font.withSize(15)
            
            fbButtonTopConstraint.constant = 15
            //            fbLeadingConstraint.constant = 10
            internetButtonTrailingConstraint.constant = 60
            
        }
        else if UIScreen.main.bounds.size.height == 568 {
            let image = UIImage(named: "nBarImage2")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
            
            coverImageHeightConstraint.constant = 150
            greenCirHeightConstraint.constant = 150
            greenCirWidthConstraint.constant = 150
            greenCirBottomConstraint.constant = -70
           
            profileImageheightConstraint.constant = 115
            profileImageWidthConstraint.constant = 115
            
            whiteViewHeightConstraint.constant =  130
            whiteViewTopConstraint.constant = -40
            
            artistLabelHeightConstraint.constant = 30
            artistLabelTopConstraint.constant = 10
            
            placeLabelHeightConstraint.constant = 20
            
            recivedText.font = recivedText.font.withSize(20)
            recivedPlace.font = recivedPlace.font.withSize(15)
            
            moreDetailsLabelHeightConstraint.constant = 150
            moreDetailsLabel.font = moreDetailsLabel.font.withSize(13)
            
            fbButtonTopConstraint.constant = 15
//            fbLeadingConstraint.constant = 10
            internetButtonTrailingConstraint.constant = 60
            
            
        }
        else {
            let image = UIImage(named: "nBarImage2")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
        
        recivedImage.layer.cornerRadius = recivedImage.frame.height / 2
        recivedImage.layer.borderColor = UIColor.white.cgColor
        recivedImage.layer.borderWidth = 5
    }
    
    override func viewDidAppear(_ animated: Bool) {
    //navigationController?.navigationBar.topItem?.title = recivedText.text
        navigationController?.navigationBar.topItem?.title = "gr"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        if UIScreen.main.bounds.size.height == 812 {
            let image = UIImage(named: "navImage")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
        else{
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
    
    
    func getDetails(){
        if recivedText.text == "A" {
            moreDetailsLabel.text = a
            print(a)
        }
        else if recivedText.text == "B" {
            moreDetailsLabel.text = b
            print(b)
        }
        else if recivedText.text == "C" {
            moreDetailsLabel.text = c
            print(c)
        }
        else if recivedText.text == "D" {
            moreDetailsLabel.text = d
            print(d)
        }
        else if recivedText.text == "E" {
            moreDetailsLabel.text = e
            print(e)
        }
        else if recivedText.text == "F" {
            moreDetailsLabel.text = f
            print(f)
        }
        else if recivedText.text == "G" {
            moreDetailsLabel.text = g
            print(g)
        }
        else if recivedText.text == "H" {
            moreDetailsLabel.text = h
            print(h)
        }
        else if recivedText.text == "I" {
            moreDetailsLabel.text = i
            print(i)
        }
        else if recivedText.text == "J" {
            moreDetailsLabel.text = j
            print(j)
        }
    }
    
    
    func openUrl(urlStr:String!) {
        
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func faceBookButtonPressed(_ sender: Any) {
        print("Facebook button pressed")
        
        if recivedFbPage == "" {
            let alert = UIAlertController(title: "Message", message: "Sorry, but there's no Facebook profile.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            openUrl(urlStr: recivedFbPage)
        }
    }
        

    
    @IBAction func instagramButtonPressed(_ sender: Any) {
        print("Instagram button pressed")
        
        if recivedInstagramPage == "" {
            let alert = UIAlertController(title: "Message", message: "Sorry, but there's no Instagram profile.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            openUrl(urlStr: recivedInstagramPage)
        }
    }
    
    
    @IBAction func internetButtonPressed(_ sender: Any) {
         print("Internet button pressed")
        
        if recivedInternetPage == "" {
            let alert = UIAlertController(title: "Message", message: "Sorry, but there's no Internet page.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            openUrl(urlStr: recivedInternetPage)
        }
    }

}
