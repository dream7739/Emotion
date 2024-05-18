//
//  EmotionViewController.swift
//  Emotion
//
//  Created by 홍정민 on 5/17/24.
//

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
    
    private var emotionLabel: [UILabel] = []
    private var emotionCount = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    private var emotionTitle = ["행복해","사랑해", "좋아해","당황해", "속상해", "우울해", "심심해", "짜증나", "눈물나"]

    @IBAction func emotionButtonClicked(_ sender: UIButton) {
        let index = sender.tag
        emotionCount[index] += 1
        emotionLabel[index].text = emotionTitle[index] + " \(emotionCount[index])"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "감정 다이어리"
        
        //Label을 꼭 배열에 담아야 하나?
        emotionLabel = [countLabel1, countLabel2, countLabel3, countLabel4, countLabel5, countLabel6, countLabel7, countLabel8, countLabel9]
        
        //태그를 사용하지 않고 할 수 있는 방법?
        slimeButton1.tag = 0
        slimeButton2.tag = 1
        slimeButton3.tag = 2
        slimeButton4.tag = 3
        slimeButton5.tag = 4
        slimeButton6.tag = 5
        slimeButton7.tag = 6
        slimeButton8.tag = 7
        slimeButton9.tag = 8
        
        slimeButton1.setImage(UIImage(named:"slime1" ), for: .normal)
        slimeButton2.setImage(UIImage(named:"slime2" ), for: .normal)
        slimeButton3.setImage(UIImage(named:"slime3" ), for: .normal)
        slimeButton4.setImage(UIImage(named:"slime4" ), for: .normal)
        slimeButton5.setImage(UIImage(named:"slime5" ), for: .normal)
        slimeButton6.setImage(UIImage(named:"slime6" ), for: .normal)
        slimeButton7.setImage(UIImage(named:"slime7" ), for: .normal)
        slimeButton8.setImage(UIImage(named:"slime8" ), for: .normal)
        slimeButton9.setImage(UIImage(named:"slime9" ), for: .normal)
        
        countLabel1.textAlignment = .center
        countLabel1.text = emotionTitle[0]
        
        countLabel2.textAlignment = .center
        countLabel2.text = emotionTitle[1]
        
        countLabel3.textAlignment = .center
        countLabel3.text = emotionTitle[2]

        countLabel4.textAlignment = .center
        countLabel4.text = emotionTitle[3]

        countLabel5.textAlignment = .center
        countLabel5.text = emotionTitle[4]

        countLabel6.textAlignment = .center
        countLabel6.text = emotionTitle[5]

        countLabel7.textAlignment = .center
        countLabel7.text = emotionTitle[6]

        countLabel8.textAlignment = .center
        countLabel8.text = emotionTitle[7]

        countLabel9.textAlignment = .center
        countLabel9.text = emotionTitle[8]


    }


}

