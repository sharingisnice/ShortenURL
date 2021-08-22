//
//  ViewController.swift
//  ShortenURL
//
//  Created by Mert Ejder on 15.08.2021.
//

import UIKit
import SnapKit
import NVActivityIndicatorView

class ViewController: UIViewController {
    
    var didSetupConstraints = false
    
    let topIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "logo")
        return icon
    }()
    
    let midIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "illustration")
        return icon
    }()
    
    let topTitle: UILabel = {
        let label = UILabel()
        label.text = Texts.topTitle
        label.textColor = Colors.textColor
        label.font = UIFont(name: "Poppins-Bold", size: 30)
        return label
    }()

    
    let middleTitle: UILabel = {
        let label = UILabel()
        label.text = Texts.middleTitle
        label.textColor = Colors.textColor
        label.font = UIFont(name: "Poppins-Medium", size: 18)
        label.numberOfLines = 2
        return label
    }()
    
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.darkViolet
        return view
    }()
    
    let bottomViewImage: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "shape")!)
        return view
    }()
    
    let urlField: UITextField = {
        let field = UITextField()
        field.placeholder = Texts.placeholder
        field.backgroundColor = .white
        field.layer.cornerRadius = 6
        field.textAlignment = .center
        return field

    }()
    
    let shortenButton: UIButton = {
        let button = UIButton()
        button.setTitle(Texts.shortenButton, for: .normal)
        button.backgroundColor = Colors.appCyan
        button.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 18)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        return button
    }()
    
    let viewModel = IndexViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setupUI()
        setDatas()
        
        viewModel.delegate = self
    }

    
    func addViews() {
        view.addSubview(topIcon)
        view.addSubview(midIcon)
        view.addSubview(topTitle)
        view.addSubview(middleTitle)
        view.addSubview(bottomView)
        view.addSubview(bottomViewImage)
        view.addSubview(urlField)
        view.addSubview(shortenButton)
        
    }
    
    func setupUI() {
        if !didSetupConstraints {
            
            topIcon.snp.makeConstraints { make in
                make.centerX.equalTo(view)
                make.height.equalTo(35)
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            }
            
            midIcon.snp.makeConstraints { make in
                make.centerX.equalTo(view)
                make.height.equalTo(300)
                make.top.equalTo(topIcon).offset(150)
            }
            
            topTitle.snp.makeConstraints { make in
                make.centerX.equalTo(view)
                make.height.equalTo(100)
                make.top.equalTo(midIcon.snp.bottom)
            }
            
            middleTitle.snp.makeConstraints { make in
                make.centerX.equalTo(view)
                make.height.equalTo(100)
                make.top.equalTo(topTitle).offset(20)
            }
            
            bottomView.snp.makeConstraints { make in
                make.centerX.equalTo(view)
                make.bottom.equalTo(self.view.snp.bottom)
                make.height.equalTo(200)
                make.width.equalTo(view)
            }
            
            bottomViewImage.snp.makeConstraints { make in
                make.right.equalTo(bottomView.snp.right)
                make.top.equalTo(bottomView.snp.top)
                make.height.equalTo(128)
                make.width.equalTo(237)
                
            }
            
            shortenButton.snp.makeConstraints { make in
                make.right.equalTo(view.snp.right).offset(-40)
                make.left.equalTo(view.snp.left).offset(40)
                make.height.equalTo(55)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
                
            }
            
            urlField.snp.makeConstraints { make in
                make.right.equalTo(view.snp.right).offset(-40)
                make.left.equalTo(view.snp.left).offset(40)
                make.bottom.equalTo(shortenButton.snp.top).offset(-10)
                make.height.equalTo(55)
                
            }
            
           

        
        }
        
        
        
    }
    
    
    @objc func buttonPress() {
        viewModel.shortenURLPressed(text: urlField.text ?? "")
        view.showLoading()
    }
    
    
    func setDatas() {
        
    }

}

extension ViewController: IndexViewModelDelegate {
    func sendShortenedURL(result: String) {
        
        
        DispatchQueue.main.async {
            self.view.stopLoading()
        }
    }
    
    
}

