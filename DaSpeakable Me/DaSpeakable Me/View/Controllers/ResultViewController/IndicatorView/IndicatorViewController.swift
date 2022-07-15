//
//  IndicatorViewController.swift
//  DaSpeakable Me
//
//  Created by jevania on 02/07/22.
//

import UIKit

class IndicatorViewController: UIViewController {
    
    @IBOutlet weak var indicatorHeader: UIView!
    @IBOutlet weak var indicatorTitleLabel: UILabel!
    @IBOutlet weak var indicatorAvatarImage: UIImageView!
    @IBOutlet weak var indicatorScoreLabel: UILabel!
    @IBOutlet weak var indicatorDescriptionLabel: UILabel!
    @IBOutlet weak var indicatorInformationLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UITextView!
    @IBOutlet weak var indicatorProgressBarImage: UIImageView!
    @IBOutlet weak var fwEhLabel: UILabel!
    @IBOutlet weak var fwHmLabel: UILabel!
    @IBOutlet weak var fwHaLabel: UILabel!
    
    var selectedIndicator: PracticeDetail!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(selectedIndicator)
        setUpView()
        indicatorHeader.cornerRadius(usingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 150, height: 150))
        
        if selectedIndicator.practiceTitleDetail != "Filler Word"{
            fwHaLabel.isHidden  = true
            fwEhLabel.isHidden  = true
            fwHmLabel.isHidden  = true
        }
        else{
            fwHaLabel.isHidden  = false
            fwEhLabel.isHidden  = false
            fwHmLabel.isHidden  = false
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        fwHaLabel.isHidden  = true
        fwEhLabel.isHidden  = true
        fwHmLabel.isHidden  = true
    }
    
    func setUpView(){
        
        indicatorTitleLabel.text = selectedIndicator.practiceTitleDetail
        indicatorAvatarImage.image = UIImage(named: selectedIndicator.practiceAvatarImageDetail ?? "micImg")
        indicatorScoreLabel.text = String(Int(selectedIndicator.practiceScore))
        indicatorDescriptionLabel.text = selectedIndicator.practiceRanking
        indicatorInformationLabel.text = "Indicators"
        descriptionTextLabel.text = selectedIndicator.practiceDescription

        fwHaLabel.text = "\(Int(selectedIndicator.practiceFwHaDetail ?? 0)) aaaa word"
        fwEhLabel.text = "\(Int(selectedIndicator.practiceFwEhDetail ?? 0)) ee ee word"
        fwHmLabel.text = "\(Int(selectedIndicator.practiceFwHmDetail ?? 0)) ummo word"
        
        //indicatorProgressBarImage.image = UIImage(named: String(selectedIndicator.practiceProgressBarDetail))
    }
    
    
}
