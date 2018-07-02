//
//  ThirdViewController.swift
//  GrApp
//
//  Created by Saša Brezovac on 13/06/2018.
//  Copyright © 2018 CopyPaste89. All rights reserved.
//

import UIKit
import AVFoundation

class GRPostCardViewController: UIViewController {

    var myGreenColor = UIColor(hex: 0x1DA84D)
    
    
    //MARK: - Outlets
    
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var cameraButtonsView: UIView!
    @IBOutlet weak var photoScreen: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    var captureSession = AVCaptureSession()
    var backCamera: AVCaptureDevice?
    var frontCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?
    
    var photoOutput: AVCapturePhotoOutput?
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    
    var image: UIImage?
    var libraryImage: UIImageView!
    
    var flashMode: Bool!
    var switchCam: Bool!
    var loadImageBtnPressed: Bool!
    
    var timer = Timer()
    var time = 10
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        loadImageBtnPressed = false
        timeLabel.isHidden = true
        switchCam = true
        
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            setupCaptureSession()
            setupDevice()
            setupInputOutput()
            setupPreviewLayer()
            startRunningCaptureSession()
        }
        else {
            print("Device has no camera")
            let alert = UIAlertController(title: "Warnning", message: "Device has no valid camera.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in
                self.goToHomeVC()
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        //SwipeBack
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        
        flashMode = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cameraButton.isEnabled = true
        time = 10
        
        photoImageView.image = nil
        loadImageBtnPressed = false
        
        cameraButtonsView.layer.opacity = 0.5
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            setupCaptureSession()
            setupDevice()
            setupInputOutput()
            setupPreviewLayer()
            startRunningCaptureSession()
        }
        else {
            print("Device has no camera")
            let alert = UIAlertController(title: "Warnning", message: "Device has no valid camera.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in
                self.goToHomeVC()
            }))
            self.present(alert, animated: true, completion: nil)
        }
        

        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationController?.navigationBar.topItem?.title = "Cam"
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
    @objc func goToHomeVC(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
//        tabBar.selectedItem = tabBar.items![0] as UITabBarItem
    }
    
    
    
    func setupCaptureSession(){
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    
    
    func setupDevice(){
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        let devices  = deviceDiscoverySession.devices
        
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                backCamera = device
            }
            else if device.position == AVCaptureDevice.Position.front {
                frontCamera = device
            }
        }
        currentCamera = backCamera
    }
    
    
    
    func setupInputOutput(){
        do {
            
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            captureSession.addInput(captureDeviceInput)
            photoOutput = AVCapturePhotoOutput()
            if #available(iOS 11.0, *) {
                photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
            } else {
               //
            }
            captureSession.addOutput(photoOutput!)
        }
        catch {
            print("error")
        }
    }
    
    
    func setupPreviewLayer(){
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        cameraPreviewLayer?.frame = self.view.frame
        self.photoScreen.layer.insertSublayer(cameraPreviewLayer!, at: 0)
    }
    
    
    func startRunningCaptureSession(){
        captureSession.startRunning()
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    @IBAction func cameraButtonPressed(_ sender: Any) {
        let settings = AVCapturePhotoSettings()
        photoOutput?.capturePhoto(with: settings, delegate: self as AVCapturePhotoCaptureDelegate)
        //performSegue(withIdentifier: "showPhotoSegue", sender: nil)
        
        saveImage()
        
        
        if flashMode == true {
            flashMode = false
            toggleOn()
        }
        else {
            flashMode = true
            toggleOff()
        }
    }
    
    
    @IBAction func flashlightButtonPressed(_ sender: Any) {
        if flashMode == true {
            flashMode = false
            toggleOn()
        }
        else {
            flashMode = true
            toggleOff()
        }
    }
    
    
    func toggleOn(){
        if let device = AVCaptureDevice.default(for: AVMediaType.video), device.hasTorch {
            do {
                try device.lockForConfiguration()
                device.torchMode = .on
                device.unlockForConfiguration()
            }
            catch {
                print("error")
            }
        }
    }
    
    func toggleOff(){
        if let device = AVCaptureDevice.default(for: AVMediaType.video), device.hasTorch {
            do {
                try device.lockForConfiguration()
                device.torchMode = .off
                device.unlockForConfiguration()
            }
            catch {
                print("error")
            }
        }
    }
    
    
    //Save image
    func saveImage(){
        if photoImageView.image != nil{
            UIImageWriteToSavedPhotosAlbum(photoImageView.image!, nil, nil, nil)
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func loadImageButtonPressed(_ sender: Any) {
        loadImageBtnPressed = true
        
        let image = UIImagePickerController()
        image.delegate = (self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
        {
            //After it is
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            photoImageView.image = image
            performSegue(withIdentifier: "showPhotoSegue", sender: nil)
        }
        else {
            print("ERROR")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func switchCameraButtonPressed(_ sender: Any) {
        //Change camera source
        let session = captureSession
        //Indicate that some changes will be made to the session
        session.beginConfiguration()
        
        //Remove existing input
        let currentCameraInput:AVCaptureInput = session.inputs.first!
        session.removeInput(currentCameraInput)
        
        //Get new input
        var newCamera:AVCaptureDevice! = nil
        if let input = currentCameraInput as? AVCaptureDeviceInput {
            if (input.device.position == .back)
            {
                newCamera = cameraWithPosition(position: .front)
            }
            else
            {
                newCamera = cameraWithPosition(position: .back)
            }
            
            
            //Add input to session
            var err: NSError?
            var newVideoInput: AVCaptureDeviceInput!
            do {
                newVideoInput = try AVCaptureDeviceInput(device: newCamera)
            } catch let err1 as NSError {
                err = err1
                newVideoInput = nil
            }
            
            if(newVideoInput == nil || err != nil)
            {
                print("Error creating capture device input: \(err!.localizedDescription)")
            }
            else
            {
                session.addInput(newVideoInput)
            }
            
            //Commit all the configuration changes at once
            session.commitConfiguration()
        }
    }
    
    func cameraWithPosition(position: AVCaptureDevice.Position) -> AVCaptureDevice?{
        let devices = AVCaptureDevice.devices(for: AVMediaType.video)
        for device in devices {
            let device = device
            if device.position == position {
                return device
            }
        }
        
        return nil
    }
    

    func switchCamera(){
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        let devices  = deviceDiscoverySession.devices
        
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                backCamera = device
            }
            else if device.position == AVCaptureDevice.Position.front {
                frontCamera = device
            }
        }
        if switchCam == true {
            switchCam = false
            currentCamera = backCamera
        }
        else {
            switchCam = true
            currentCamera = frontCamera
        }
    }
    
    
    
    @IBAction func cameraTimerButtonPressed(_ sender: Any) {
        timeLabel.isHidden = false
        cameraButton.isEnabled = false
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeAction), userInfo: nil, repeats: true)
    }
    
    @objc func timeAction(){
        time -= 1
        timeLabel.text = "\(time)"
        if time == 0 {
            timer.invalidate()
            timeLabel.isHidden = true
            time = 10
            let settings = AVCapturePhotoSettings()
            photoOutput?.capturePhoto(with: settings, delegate: self as AVCapturePhotoCaptureDelegate)
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotoSegue" && loadImageBtnPressed == false {
            let previewVC = segue.destination as! GRPostCardViewController
            previewVC.image = self.image    
        }
        else if segue.identifier == "showPhotoSegue" {
            let previewVController = segue.destination as! GRSharePostcardViewController
            previewVController.image = photoImageView.image
        }
    }
    
    
}

extension GRPostCardViewController: AVCapturePhotoCaptureDelegate {
    @available(iOS 11.0, *)
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation() {
            print(imageData)
            image = UIImage(data: imageData)
            performSegue(withIdentifier: "showPhotoSegue", sender: nil)
        }
    }
}

