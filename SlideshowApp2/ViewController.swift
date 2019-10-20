//
//  ViewController.swift
//  SlideshowApp2
//
//  Created by 高村拓 on 2019/10/19.
//  Copyright © 2019 taku.takamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton! // 進む
    @IBOutlet weak var backButton: UIButton! // 戻る
    @IBOutlet weak var switchButton: UIButton! // 再生・停止
    
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    // 一定の間隔で処理を行うためのタイマー
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 初期画面
        // バンドルした画像ファイルを読み込み
        // Image Viewに画像を設定
        let image = UIImage(named: "IMG1")
        imageView.image = image
        
        // 表示している画像の番号
        var displayImageNo = 0
        
        //画像の名前の配列
        let imageNameArray = ["IMG1","IMG2","IMG3","IMG4","IMG5"]
        
        // 表示している画像の番号を元に画像を表示する
        func displayImage() {
        
            // 表示している画像の番号から名前を取り出し
            let name = imageNameArray[displayImageNo]
            
            // 画像を読み込み
            let image = UIImage(named: name)
            
            // Image Viewに読み込んだ画像をセット
            imageView.image = image
        }
    }
    // 表示している画像の番号
    var displayImageNo = 0
    
    //画像の名前の配列
    let imageNameArray = ["IMG1","IMG2","IMG3","IMG4","IMG5"]
    
    
    // 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[displayImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    // タップした場合
    // 進むボタン
    @IBAction func nextButtontap(_ sender: Any) {
        if displayImageNo < imageNameArray.count - 1 {
            // 表示している画像の番号を１増やす
            displayImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        } else {
            displayImageNo = 0
            displayImage()
        }
    }
    // 戻るボタン
    @IBAction func backButtontap(_ sender: Any) {

        if displayImageNo >= 1 && displayImageNo <= imageNameArray.count - 1 {
            // 表示している画像の番号を１減らす
            displayImageNo -= 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
    } else {
            displayImageNo = imageNameArray.count - 1
            displayImage()
        }
    }
    

    
    // 略
    
    
    // 再生・停止ボタン
    @IBAction func switchButtontap(_ sender: Any) {
        // 動作中のタイマーを１つに保つために、timer が存在しない場合だけ、タイマーを生成して動作させる
        if timer == nil {
            // タイマーを設定
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            nextButton.isEnabled = false
            backButton.isEnabled = false
            // ボタンの名前を停止とする
            switchButton.setTitle("停止", for: .normal)

            
        } else if self.timer != nil {
            // タイマーを停止
            self.timer.invalidate()
            // nil にして再び再生(nil の時にタイマー生成)
            self.timer = nil
            // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            nextButton.isEnabled = true
            backButton.isEnabled = true
            // ボタンの名前を再生とする
            switchButton.setTitle("再生", for: .normal)

        }
    }
    // #selectorで呼び出される関数
    @objc func updateTimer(_ timer: Timer) {
        //　進むボタンの内容を行う
        if displayImageNo < imageNameArray.count - 1 {
            // 表示している画像の番号を１増やす
            displayImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
            print(displayImageNo) // 取得インデックスの確認
        } else {
            displayImageNo = 0
            displayImage()
            print(displayImageNo) // 取得インデックスの確認
        }
        
    }
    @IBAction func onTapAction(_ sender: Any) {
        self.performSegue(withIdentifier: "toResult", sender: nil)
    }
    
    // 画面遷移時の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // スライドショーを停止してから画面遷移する
        if timer != nil {
            // スライドショーの停止
            timer.invalidate()
            timer = nil
            // ボタンをスライドショー停止状態にする
            switchButton.setTitle("開始", for: .normal)
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }
        // 表示中の画像を引き継ぎ
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[displayImageNo]
        // 画像を読み込み
        let image = UIImage(named: name)
        
    // 遷移先のResultViewControllerで宣言しているselectedImgに値を代入して渡す
        resultViewController.selectedImg = image
        

    }
    
    // 画面遷移の戻り用メソッド
    @IBAction func unwind(_ segue:UIStoryboardSegue) {
    }
}
    
