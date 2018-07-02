//
//  ViewController.swift
//  GrApp
//
//  Created by Saša Brezovac on 12/06/2018.
//  Copyright © 2018 CopyPaste89. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var artists = [Artist]()
    
    var myGreenColor = UIColor(hex: 0x1DA84D)
    
    
    //MARK: - Outlets
    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var sideMenuWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var sideMenuTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var lineUpTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var gRoomSideMenuImageView: UIImageView!
    @IBOutlet weak var lineUpImage: UIImageView!
    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var aboutUsImage: UIImageView!
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var languageImage: UIImageView!
    
    @IBOutlet weak var pickArtistCollectionView: UICollectionView!
    
    
    
    @IBOutlet weak var lineUpButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var infoButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var aboutUsButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var contactsButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var languageButtonHeightConstraint: NSLayoutConstraint!
    
    
    
    
    
    
    var sideMenu: Bool!
    
    let artistPicArray: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    var selectedImage: String!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setArtist()
        
        pickArtistCollectionView.delegate = self
        pickArtistCollectionView.dataSource = self
        
        sideMenu = false
        sideMenuView.isHidden = true
        sideMenuWidthConstraint.constant = 0
        
        
        gRoomSideMenuImageView.layer.borderWidth = 1.0
        gRoomSideMenuImageView.layer.masksToBounds = false
        gRoomSideMenuImageView.layer.borderColor = UIColor.white.cgColor
        gRoomSideMenuImageView.layer.cornerRadius = gRoomSideMenuImageView.frame.size.height/2
        gRoomSideMenuImageView.layer.borderWidth = 3
        gRoomSideMenuImageView.layer.borderColor = UIColor.white.cgColor
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        sideMenu = false
        sideMenuWidthConstraint.constant = 0
        
        let menuButtonImage = UIImage(named: "menuBtn")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuButtonImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(getSideMenu))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationController?.navigationBar.topItem?.title = "gr"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        
        if UIScreen.main.bounds.size.height == 812 {
            sideMenuTopConstraint.constant = 86
            lineUpTopConstraint.constant = 60
            
            let image = UIImage(named: "navImage")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
        else if UIScreen.main.bounds.size.height == 568 {
            sideMenuTopConstraint.constant = 64
            lineUpTopConstraint.constant = 10
            
            
            lineUpButtonHeightConstraint.constant = 55
            infoButtonHeightConstraint.constant = 55
            aboutUsButtonHeightConstraint.constant = 55
            contactsButtonHeightConstraint.constant = 55
            languageButtonHeightConstraint.constant = 55
            
            
            let image = UIImage(named: "nBarImage2")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
        else {
            sideMenuTopConstraint.constant = 64
            lineUpTopConstraint.constant = 10
            
            
            let image = UIImage(named: "nBarImage2")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    
    //MARK: - Actions
    private func setArtist() {
        artists.append(Artist(name: "A", place: "CRO", stage: "stageOne", image: "a", time: "22:00 pm - 00:00 pm", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "B", place: "CRO", stage: "stageOne", image: "b", time: "00:00 am - 02:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "C", place: "CRO", stage: "stageOne", image: "c", time: "02:00 am - 04:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "D", place: "CRO", stage: "stageOne", image: "d", time: "22:00 pm - 00:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "E", place: "CRO", stage: "stageOne", image: "e", time: "00:00 am - 02:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "F", place: "CRO", stage: "stageOne", image: "f", time: "02:00 am - 04:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "", insta: "", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "G", place: "CRO", stage: "stageTwo", image: "g", time: "22:00 pm -23:00 pm", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: false, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https:https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "H", place: "CRO", stage: "stageTwo", image: "h", time: "23:00 pm - 00:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: false, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))

        artists.append(Artist(name: "I", place: "CRO", stage: "stageTwo", image: "i", time: "00:00 am - 01:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: false, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: ""))
        
        artists.append(Artist(name: "J", place: "CRO", stage: "stageTwo", image: "j", time: "01:00 am - 02:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: false, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "", internetPage: ""))

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artistPicArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
       
        cell.pickArtistImageView.image = UIImage(named: artistPicArray[indexPath.row])
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIScreen.main.bounds.size.height == 568 {
            return CGSize(width: 140.0, height: 140.0)
        }
        else{
            
            let padding: CGFloat =  10
            let collectionViewSize = collectionView.frame.size.width - padding
            
            return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("user tapped at image #\(indexPath.row)")
        
        let myImageViewPage : HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        myImageViewPage.selectedImage = artistPicArray[indexPath.row]
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "GRDetailArtistViewController") as! GRDetailArtistViewController
        
            detailVC.getName = artists[indexPath.row].name
            detailVC.getPicture = UIImage(named: artists[indexPath.row].image)
            detailVC.getPlace = artists[indexPath.row].place
            detailVC.getFb = artists[indexPath.row].fb
            detailVC.getInsta = artists[indexPath.row].insta
            detailVC.getIntPage = artists[indexPath.row].internetPage
            self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            print("Image Tapped")
            //Here you can initiate your new ViewController
            
        }
    }
    
    
    
    @IBAction func lineUpButtonPressed(_ sender: Any) {
        sideMenuView.isHidden = true
        sideMenu = false
    }
    
    @objc func getSideMenu(){
        if sideMenu == true {
            sideMenu = false
            
            sideMenuView.isHidden = true
            sideMenuWidthConstraint.constant = 0
            
            if sideMenuWidthConstraint.constant == 305 {
                sideMenuWidthConstraint.constant = 0
            }
        }
        else {
            sideMenu = true
            sideMenuView.isHidden = false
            sideMenuWidthConstraint.constant = 305
            
            if sideMenuWidthConstraint.constant == 0 {
                sideMenuWidthConstraint.constant = 305
            }
        }
    }
    
    
    @IBAction func panPerformed(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view).x
            
            if translation > 0 { //swipe right
                
                if sideMenuWidthConstraint.constant < 20 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.sideMenuWidthConstraint.constant = 305

                        self.sideMenuView.isHidden = false
                        
                        self.view.layoutIfNeeded()
                    })
                }
            }
            else { //swipe left
                if sideMenuWidthConstraint.constant > 300 {
                    
                    UIView.animate(withDuration: 0.2, animations: {
                        self.sideMenuWidthConstraint.constant = 0

                        //                        self.slideMenuWidthConstraint.constant = 0
                        
                        self.sideMenuView.isHidden = true
                        
                        self.view.layoutIfNeeded()
                    })
                }
            }
        }
        else if sender.state == .ended {
            if sideMenuWidthConstraint.constant < -100 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.sideMenuWidthConstraint.constant = 0
        
                    
                    self.sideMenuView.isHidden = true
                    
                    self.view.layoutIfNeeded()
                    
                })
            }
            else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.sideMenuWidthConstraint.constant = 305
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    

    @IBAction func languageButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Message", message: "English is only available language.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}


