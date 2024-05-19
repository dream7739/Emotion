//
//  EmotionViewController2.swift
//  Emotion
//
//  Created by 홍정민 on 5/18/24.
// 2. Tuple로 구현
// UIButton tag 이용

import UIKit

class EmotionViewController2: UIViewController {
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
    
    typealias emotion = (emotionTitle: String, emotionImageName: String, emotionCount: Int)
    private var emotionCounts: [emotion] = [("행복해", "slime1", 0), ("사랑해", "slime2", 0),
                                            ("좋아해", "slime3" ,0), ("당황해", "slime4", 0),
                                            ("속상해", "slime5", 0), ("우울해", "slime6", 0),
                                            ("심심해", "slime7", 0), ("짜증나", "slime8", 0),
                                            ("눈물나", "slime9", 0)]
    
    private var emotionLabels: [UILabel] = []
    private var emotionButtons: [UIButton] = []
    
    
    @IBAction func emotionButtonClicked(_ sender: UIButton) {
        let idx = sender.tag
        emotionCounts[idx].2 += 1
        emotionLabels[idx].text = emotionCounts[idx].0 + " \(emotionCounts[idx].2)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "감정 다이어리"
        
        emotionLabels = [countLabel1, countLabel2, countLabel3, countLabel4, countLabel5, countLabel6, countLabel7, countLabel8, countLabel9]
        
        emotionButtons = [slimeButton1, slimeButton2, slimeButton3, slimeButton4, slimeButton5, slimeButton6, slimeButton7, slimeButton8, slimeButton9]
        
        for idx in 0...8 {
            emotionButtons[idx].tag = idx
            emotionLabels[idx].text = emotionCounts[idx].0
            emotionLabels[idx].textAlignment = .center
            emotionButtons[idx].setImage(UIImage(named: emotionCounts[idx].1), for: .normal)
        }
        
         
    }
    
    
    
    
}
