//
//  PriceViewController.swift
//  bamin
//
//  Created by junseok on 11/8/23.
//

import UIKit

class PriceViewController: UIViewController {
    var Info : info = info(dow: false, size: false)

    @IBOutlet weak var size_label: UILabel!
    
    @IBOutlet weak var dow_label: UILabel!
    
    @IBOutlet weak var price_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.Info.size == false {
            size_label.text = "medium"
        } else {
            size_label.text = "true"
        }
        
        if self.Info.dow == false {
            dow_label.text = "기본"
        } else {
            dow_label.text = "추가"
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
