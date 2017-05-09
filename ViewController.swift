//
//  ViewController.swift
//  Generate Barcode QR Code
//
//  Created by Vaibhav Kumar Singh on 07/05/17.
//  Copyright © 2017 Vaibhav Kumar Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var barImage: UIImageView!
    @IBOutlet weak var barcodeText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generateBarCode(_ sender: Any) {
        barImage.image = generateBarCodeFromString(string: barcodeText.text!)
        
    }
    
    @IBAction func generateQRCode(_ sender: Any) {
        barImage.image = generateQRCodeFromString(string: barcodeText.text!)
    }

    
    func generateBarCodeFromString(string: String) -> UIImage{
        
        let data = string.data(using: String.Encoding.ascii)
        let filter = CIFilter(name: "CICode128BarcodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let output = filter?.outputImage?.applying(transform)
        
//        if output != nil{
//         //   return UIImage(CIImage: output!)
//            return UIImage(ciImage: output!)
//        }
        return UIImage(ciImage: output!)

        
    }
    
    
    func generateQRCodeFromString(string: String) -> UIImage{
        
        let data = string.data(using: String.Encoding.ascii)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let output = filter?.outputImage?.applying(transform)
        
//        if output != nil{
//            //   return UIImage(CIImage: output!)
//            return UIImage(ciImage: output!)
//        }
        return UIImage(ciImage: output!)
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

