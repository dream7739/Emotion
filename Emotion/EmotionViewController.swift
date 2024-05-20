//
//  EmotionViewController.swift
//  Emotion
//
//  Created by 홍정민 on 5/17/24.
//  1. Array로 구현

import UIKit

class EmotionViewController: UIViewController {
    @IBOutlet var slimeButton1: UIButton!
    @IBOutlet var slimeButton2: UIButton!
    @IBOutlet var slimeButton3: UIButton!
    @IBOutlet var slimeButton4: UIButton!
    @IBOutlet var slimeButton5: UIButton!
    @IBOutlet var slimeButton6: UIButton!
    @IBOutlet var slimeButton7: UIButton!
    @IBOutlet var slimeButton8: UIButton!
    @IBOutlet var slimeButton9: UIButton!
    
    @IBOutlet var countLabel1: UILabel!
    @IBOutlet var countLabel2: UILabel!
    @IBOutlet var countLabel3: UILabel!
    @IBOutlet var countLabel4: UILabel!
    @IBOutlet var countLabel5: UILabel!
    @IBOutlet var countLabel6: UILabel!
    @IBOutlet var countLabel7: UILabel!
    @IBOutlet var countLabel8: UILabel!
    @IBOutlet var countLabel9: UILabel!
    
    @IBOutlet var emotionLabels: [UILabel]!
    @IBOutlet var emotionButtons: [UIButton]!
    
    private let emotionImages: [UIImage] = [UIImage(named:"slime1")!,
                                            UIImage(named:"slime2")!,
                                            UIImage(named:"slime3")!,
                                            UIImage(named:"slime4")!,
                                            UIImage(named:"slime5")!,
                                            UIImage(named:"slime6")!,
                                            UIImage(named:"slime7")!,
                                            UIImage(named:"slime8")!,
                                            UIImage(named:"slime9")!]
    
    private var emotionCounts = Array(repeating: 0, count: 9)
    private let emotionTitles = ["행복해", "사랑해", "좋아해",
                                 "당황해", "속상해", "우울해",
                                 "심심해", "짜증나", "눈물나"]
    
    @IBAction func emotionButtonClicked(_ sender: UIButton) {
        let idx = sender.tag
        emotionCounts[idx] += 1
        emotionLabels[idx].text = emotionTitles[idx] + " \(emotionCounts[idx])"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //네비게이션 타이틀 설정
        navigationItem.title = "감정 다이어리"
       
        //버튼 디자인 적용 및 레이블 디자인 적용
        for i in 0..<9 {
            designButton(idx: i, emotionButtons[i], emotionImages[i])
            designLabel(emotionLabels[i], emotionTitle: emotionTitles[i])
        }
        
    }
    
    //버튼 디자인 적용
    fileprivate func designButton(idx: Int, _ sender: UIButton, _ image: UIImage){
        sender.tag = idx
        sender.setImage(image, for: .normal)
    }
    
    //레이블 디자인 적용
    fileprivate func designLabel(_ sender: UILabel, emotionTitle title: String){
        sender.textAlignment = .center
        sender.text = title
    }
    
    
}

