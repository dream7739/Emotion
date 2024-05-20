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
    @IBOutlet var hashTagButtonList: [UIButton]!
    
    private var wordDictionary: [String: String] = ["다꾸": "다이어리 꾸미기",
                                                    "오하운":"오늘 하루 운동",
                                                    "폼 미쳤다": "역량이 뛰어나다는 의미. 때로는 비꼬는 의미로 사용하기도 함.",
                                                    "제당슈만": "제가 당신을 슈퍼스타로 만들어 드릴게요.",
                                                    "무물보": "무엇이든 물어보세요",
                                                    "갑통알": "갑자기 통장을 보니 알바를 해야겠다.",
                                                    "알잘딱깔센": "알아서 잘 딱 깔끔하고 센스 있게",
                                                    "아만추": "아무나 만남 추구",
                                                    "꾸안꾸": "꾸민 듯 안꾸민듯",
                                                    "삼귀다": "사귀기 전 사이",
                                                    "혼코노": "혼자 코인노래방 가기",
                                                    "rizz": "매력·끼를 발산하다",
                                                    "asap": "가능한 한 빨리"]
    
    private var randomKeyword:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designBackgorundView(textBackgroundView)
        designTextField(searchTextField, placeholder: "신조어를 검색하세요")
        designSearchButton(searchButton, "magnifyingglass")
        
        for hashTagButton in hashTagButtonList {
            designButton(hashTagButton)
        }
        
        designImageView(mentboxImageView, "background")
        designLabel(mentLabel, resultText: "신조어를 검색하세요")
        
        //랜덤 키워드 설정
        getRandomKeyword()
        
    }
    
    //키보드 내림 기능 추가, 버튼 클릭 시 or 화면 터치 시
    @IBAction func keyboardDismiss(_ sender: Any) {
        view.endEditing(true)
    }
    
    //검색결과 입력 후 엔터버튼 클릭 시
    //textField에 입력한 키워드로 검색결과를 표시하고 랜덤 키워드를 변경
    @IBAction func searchEndClicked(_ sender: UITextField) {
        let keyword = sender.text!
        searchWord(keyword: keyword)
        getRandomKeyword()
    }
    
    //해시태그 클릭 시
    //해시태그 타이틀에 있는 키워드로 검색결과를 표시하고 랜덤 키워드를 변경
    @IBAction func hashTagButtonClicked(_ sender: UIButton) {
        let keyword = sender.currentTitle!
        searchWord(keyword: keyword)
        searchTextField.text = keyword
        getRandomKeyword()
    }
    
    //검색 버튼 클릭 시
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        let keyword = searchTextField.text!
        searchWord(keyword: keyword)
        getRandomKeyword()
    }
    
    //해시태그 버튼을 랜덤 키워드로 변경
    private func getRandomKeyword(){
        randomKeyword = []
        
        while randomKeyword.count < 4 {
            let keyword = wordDictionary.randomElement()!.key
            if !randomKeyword.contains(keyword) && keyword.count < 4{
                hashTagButtonList[randomKeyword.count].setTitle(keyword, for: .normal)
                randomKeyword.append(keyword)
            }
        }
        
        // print(randomKeyword)
        
    }
    
    //키워드 검색 시 결과화면에 표시
    //공백제거, 소문자로만 검색되도록 변경
    private func searchWord(keyword: String){
        let trimKeyword = keyword.trimmingCharacters(in: .whitespaces).lowercased()
        if wordDictionary[trimKeyword] != nil{
            mentLabel.text = wordDictionary[trimKeyword]
        }else{
            mentLabel.text = "검색결과가 없습니다"
        }
        
    }
    
    //버튼 스타일 적용
    fileprivate func designButton(_ sender: UIButton){
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.cornerRadius = 15
        sender.layer.borderWidth = 2
        sender.tintColor = .black
    }
    
    //텍스트필드 스타일 적용
    fileprivate func designTextField(_ sender: UITextField, placeholder: String){
        sender.borderStyle = .none
        sender.tintColor = .black
        sender.placeholder = placeholder
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        sender.leftView = paddingView
        sender.clearButtonMode = .always
        sender.leftViewMode = .always
    }
    
    // 텍스트필드 배경 테두리 스타일 적용
    fileprivate func designBackgorundView(_ sender: UIView){
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.borderWidth = 2.0
    }
    
    // 검색버튼 스타일 적용
    fileprivate func designSearchButton(_ sender : UIButton, _ image: String){
        sender.backgroundColor = .black
        sender.setImage(UIImage(systemName: image), for: .normal)
        sender.setTitle("", for: .normal)
        sender.tintColor = .white
    }
    
    // 신조어 검색결과 이미지뷰 스타일 적용
    fileprivate func designImageView(_ sender : UIImageView, _ image: String){
        sender.contentMode = .scaleAspectFill
        sender.image = UIImage(named: image)
    }
    
    fileprivate func designLabel(_ sender : UILabel, resultText: String){
        sender.text = resultText
        sender.textAlignment = .center
        sender.numberOfLines = 0
        sender.font = .systemFont(ofSize: 20)
    }
}
