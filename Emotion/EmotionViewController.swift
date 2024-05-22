//
//  EmotionViewController.swift
//  Emotion
//
//  Created by 홍정민 on 5/17/24.
//  1. Array로 구현

import UIKit

class EmotionViewController: UIViewController {
    @IBOutlet var clearButton: UIButton!
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
        
        savedEmotionCount(emotionCounts)
    }
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        emotionCounts = emotionCounts.map{ $0 * 0 }
        
        for idx in 0...emotionLabels.count-1 {
            designLabel(idx: idx, emotionLabels[idx], emotionTitle: emotionTitles[idx])
        }
        
        savedEmotionCount(emotionCounts)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedEmotionCounts = UserDefaults.standard.array(forKey: "emotionCounts") as? [Int] {
            emotionCounts = savedEmotionCounts
            print(savedEmotionCounts)
        }
        
        //네비게이션 타이틀 설정
        navigationItem.title = "감정 다이어리"
        
        //버튼 디자인 적용 및 레이블 디자인 적용
        for i in 0...emotionLabels.count-1 {
            designButton(idx: i, emotionButtons[i], emotionImages[i])
            designLabel(idx: i, emotionLabels[i], emotionTitle: emotionTitles[i])
        }
        
        //클리어버튼 디자인 적용
        clearButton.setTitle("초기화", for: .normal)
        clearButton.layer.borderColor = UIColor.black.cgColor
        clearButton.layer.borderWidth = 1
        clearButton.layer.cornerRadius = 10
        clearButton.tintColor = .black
        
    }
    
    private func savedEmotionCount(_ value: [Int]){
        UserDefaults.standard.setValue(value, forKey: "emotionCounts")
    }
    
    //버튼 디자인 적용
    private func designButton(idx: Int, _ sender: UIButton, _ image: UIImage){
        sender.tag = idx
        sender.setImage(image, for: .normal)
    }
    
    //레이블 디자인 적용
    private func designLabel(idx: Int, _ sender: UILabel, emotionTitle title: String){
        sender.textAlignment = .center
        
        //0인 상태면 count 반영하지 않고 0이 아니면 count 반영
        let emotionCount = emotionCounts[idx]
        
        if emotionCount == 0 {
            sender.text = title
        }else{
            sender.text = title + " \(emotionCount)"
        }
    }
    
}

