//
//  LogoView.swift
//  Instagram
//
//  Created by Никита  on 23.04.2024.
//


import SnapKit
import UIKit

class LogoView:UIView{
    
    init(){
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private enum UIConstraint{
        static let logoWidth:CGFloat = 104
        static let logoHeigt:CGFloat = 30
    }
    
    private let imageView:UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "InstagrammLogo")
        return view
    }()
    
    
}
private extension LogoView {
    func initialize() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(UIConstraint.logoWidth)
            make.height.equalTo(UIConstraint.logoHeigt)
        }
    }
}



