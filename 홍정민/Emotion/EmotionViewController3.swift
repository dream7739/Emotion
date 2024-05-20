//
//  EmotionViewController3.swift
//  Emotion
//
//  Created by 홍정민 on 5/19/24.
// 3. enum 사용
// IBOutlet collection 사용

import UIKit

private enum Emotion : Int {
    case happy = 0
    case love = 1
    case like = 2
    case embarrassed = 3
    case upset = 4
    case gloomy = 5
    case boring = 6
    case annoying = 7
    case sad = 8
}

class EmotionViewController3: UIViewController {
    @IBOutlet var slimeButton1: UIButton!
    @IBOutlet var slimeButton2: UIButton!
    @IBOutlet var slimeButton3: UIButton!
    @IBOutlet var slimeButton4: UIButton!
    @IBOutlet var slimeButton5: UIButton!
    @IBOutlet var slimeButton6: UIButton!
    @IBOutlet var slimeButton7: UIButton!
    @IBOutlet var slimeButton8: UIButton!
    @IBOutlet var slimeButton9: UIButton!
    
    //@IBOutlet collection 사용
    @IBOutlet var countLabels: [UILabel]!
    
    private let emotionTitles = ["행복해", "사랑해", "좋아해",
                                 "당황해", "속상해", "우울해",
                                 "심심해", "짜증나", "눈물나"]
    
    private var emotionCounts = Array(repeating: 0, count: 9)
    
    @IBAction func emotionButtonClicked(_ sender: UIButton) {
        let idx = sender.tag
        emotionCounts[idx] += 1
        countLabels[idx].text = emotionTitles[idx] + " \(emotionCounts[idx])"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "감정 다이어리"
        
        designButton(slimeButton1, .happy)
        designButton(slimeButton2, .love)
        designButton(slimeButton3, .like)
        designButton(slimeButton4, .embarrassed)
        designButton(slimeButton5, .upset)
        designButton(slimeButton6, .gloomy)
        designButton(slimeButton7, .boring)
        designButton(slimeButton8, .annoying)
        designButton(slimeButton9, .sad)
        
        for (idx, countLabel) in countLabels.enumerated(){
            designLabel(countLabel, idx)
        }
    }
    
    
    fileprivate func designButton(_ sender: UIButton, _ emotion: Emotion){
        sender.tag = emotion.rawValue
        
        switch emotion {
        case .happy:
            sender.setImage(UIImage(named: "slime1"), for: .normal)
        case .love:
            sender.setImage(UIImage(named: "slime2"), for: .normal)
        case .like:
            sender.setImage(UIImage(named: "slime3"), for: .normal)
        case .embarrassed:
            sender.setImage(UIImage(named: "slime4"), for: .normal)
        case .upset:
            sender.setImage(UIImage(named: "slime5"), for: .normal)
        case .gloomy:
            sender.setImage(UIImage(named: "slime6"), for: .normal)
        case .boring:
            sender.setImage(UIImage(named: "slime7"), for: .normal)
        case .annoying:
            sender.setImage(UIImage(named: "slime8"), for: .normal)
        case .sad:
            sender.setImage(UIImage(named: "slime9"), for: .normal)
            
        }
        
    }
    
    fileprivate func designLabel(_ sender: UILabel, _ idx: Int){
        sender.text = emotionTitles[idx]
        sender.textAlignment = .center
    }
    
}
