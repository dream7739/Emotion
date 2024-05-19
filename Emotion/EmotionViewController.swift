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
    
    private var emotionLabels: [UILabel] = []
    private var emotionButtons: [UIButton] = []
    private var emotionImages: [UIImage] = []
    
    private var emotionCounts = Array(repeating: 0, count: 9)
    private let emotionTitles = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "짜증나", "눈물나"]
    
    @IBAction func emotionButtonClicked(_ sender: UIButton) {
        guard let index = emotionButtons.firstIndex(of: sender) else { return  }
        emotionCounts[index] += 1
        emotionLabels[index].text = emotionTitles[index] + " \(emotionCounts[index])"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //네비게이션 타이틀 설정
        navigationItem.title = "감정 다이어리"
        
        //emotionLabel 배열 초기화
        emotionLabels = [countLabel1, countLabel2, countLabel3, countLabel4, countLabel5, countLabel6, countLabel7, countLabel8, countLabel9]
        
        //emotionButtons 배열 초기화
        emotionButtons = [slimeButton1, slimeButton2, slimeButton3, slimeButton4, slimeButton5, slimeButton6, slimeButton7, slimeButton8, slimeButton9]
        
        //emotionImages 배열 초기화
        emotionImages = [UIImage(named:"slime1")!, UIImage(named:"slime2")!, UIImage(named:"slime3")!, UIImage(named:"slime4")!, UIImage(named:"slime5")!, UIImage(named:"slime6")!, UIImage(named:"slime7")!, UIImage(named:"slime8")!, UIImage(named:"slime9")!]
        
        //버튼 디자인 적용 및 레이블 디자인 적용
        for i in 0..<9 {
            designButton(emotionButtons[i], emotionImages[i])
            designLabel(emotionLabels[i], emotionTitles[i])
        }
        
    }
    
    //버튼 디자인 적용
    fileprivate func designButton(_ sender: UIButton, _ img: UIImage){
        sender.setImage(img, for: .normal)
    }
    
    //레이블 디자인 적용
    fileprivate func designLabel(_ sender: UILabel, _ emotionTitle: String){
        sender.textAlignment = .center
        sender.text = emotionTitle
        
    }
    
    
}

