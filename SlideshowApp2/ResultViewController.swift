//
//  ResultViewController.swift
//  SlideshowApp2
//
//  Created by 高村拓 on 2019/10/20.
//  Copyright © 2019 taku.takamura. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    // 引き継ぎ画像
    var selectedImg: UIImage!
    
    // Do any additional setup after loading the view.
    
  
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Image Viewに画像を設定
        imageView.image = selectedImg
    }
    //　戻る
    @IBAction func backbtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
