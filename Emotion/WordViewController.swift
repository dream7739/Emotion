//
//  WordViewController.swift
//  Emotion
//
//  Created by 홍정민 on 5/17/24.
//

import UIKit

class WordViewController: UIViewController {

    @IBOutlet var textBackgroundView: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var hashTagButton1: UIButton!
    @IBOutlet var hashTagButton2: UIButton!
    @IBOutlet var hashTagButton3: UIButton!
    @IBOutlet var hashTagButton4: UIButton!
    @IBOutlet var mentboxImageView: UIImageView!
    @IBOutlet var mentLabel: UILabel!
    
    //검색결과 입력 후 엔터버튼 클릭 시
    @IBAction func searchEndClicked(_ sender: UITextField) {
        let keyword = sender.text!
        searchWord(keyword: keyword)
        getRandomKeyword()
    }
    
    //해시태그 클릭 시
    @IBAction func hashTagButtonClicked(_ sender: UIButton) {
        let keyword = sender.currentTitle!
        searchWord(keyword: keyword)
        searchTextField.text = keyword
    }
    
    //검색 버튼 클릭 시
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        let keyword = searchTextField.text!
        searchWord(keyword: keyword)
        getRandomKeyword()
    }
    
    private var wordDictionary: [String: String] = ["다꾸": "다이어리 꾸미기", "오하운":"오늘 하루 운동", "폼 미쳤다": "역량이 뛰어나다는 의미. 때로는 비꼬는 의미로 사용하기도 함.", "제당슈만": "제가 당신을 슈퍼스타로 만들어 드릴게요.", "무물보": "무엇이든 물어보세요", "갑통알": "갑자기 통장을 보니 알바를 해야겠다.", "알잘딱깔센": "알아서 잘 딱 깔끔하고 센스 있게", "아만추": "아무나 만남 추구", "꾸안꾸": "꾸민 듯 안꾸민듯", "삼귀다": "사귀기 전 사이", "혼코노": "혼자 코인노래방 가기"]
    
    private var randomKeyword:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textBackgroundView.layer.borderColor = UIColor.black.cgColor
        textBackgroundView.layer.borderWidth = 2.0
        
        searchTextField.borderStyle = .none
        searchTextField.tintColor = .black
        searchTextField.placeholder = "신조어를 입력하세요"
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        searchTextField.leftView = paddingView
        searchTextField.clearButtonMode = .always
        searchTextField.leftViewMode = .always
        
        searchButton.backgroundColor = .black
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.setTitle("", for: .normal)
        searchButton.tintColor = .white
        
        
        applyButtonStyle(hashTagButton1)
        applyButtonStyle(hashTagButton2)
        applyButtonStyle(hashTagButton3)
        applyButtonStyle(hashTagButton4)
        
        mentboxImageView.contentMode = .scaleAspectFill
        mentboxImageView.image = UIImage(named: "background")
        
        mentLabel.text = "신조어를 검색하세요"
        mentLabel.textAlignment = .center
        mentLabel.numberOfLines = 0
        mentLabel.font = .systemFont(ofSize: 20)
        
        //랜덤 키워드 설정
        getRandomKeyword()

    }
    
    //해시태그 버튼을 랜덤 키워드로 변경
    private func getRandomKeyword(){
        randomKeyword = []

        while randomKeyword.count < 5 {
            let keyword = wordDictionary.randomElement()!.key
            if !randomKeyword.contains(keyword) && keyword.count < 4{
                randomKeyword.append(keyword)
            }
        }
        
        hashTagButton1.setTitle(randomKeyword[0], for: .normal)
        hashTagButton2.setTitle(randomKeyword[1], for: .normal)
        hashTagButton3.setTitle(randomKeyword[2], for: .normal)
        hashTagButton4.setTitle(randomKeyword[3], for: .normal)
    }
    
    //키워드 검색 시 결과화면에 표시
    private func searchWord(keyword: String){
        if wordDictionary[keyword] != nil{
            mentLabel.text = wordDictionary[keyword]
        }else{
            mentLabel.text = "검색결과가 없습니다"
        }
        
    }
    
    //버튼 스타일 적용
    private func applyButtonStyle(_ btn: UIButton){
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 2
        btn.tintColor = .black
    }
    
    
    //화면 터치 시 키보드를 내림
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

  
}
