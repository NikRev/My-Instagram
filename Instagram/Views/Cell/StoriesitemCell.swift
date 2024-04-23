import SnapKit
import UIKit

class StoriesitemCell:UICollectionViewCell{
    
    func configure(with info: FeedStoriesItemCellInfo){
        
        imageView.image = info.image
        userNameLabel.text = info.username
        plusButton.isHidden = !info.isAddButtonVisiable
        circleImageView.isHidden = !info.isNewStory
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialeze()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private enum UIConstraint{
        static let imageSize:CGFloat = 60
        static let imageToCelInset:CGFloat = 6
        static let labelToCellInset:CGFloat = 6
        static let imageToLabelOfSet:CGFloat = 6
        static let usernameFont:CGFloat = 13
        static let plusButtonSize:CGFloat = 20
        static let circelSize:CGFloat = 72
    }
    
    
    private let imageView:UIImageView = {
        let view = UIImageView()
      //  view.image = UIImage(systemName: "")
        view.layer.cornerRadius = UIConstraint.imageSize/2
        view.clipsToBounds = true
        return view
    }()
    
    private let userNameLabel:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstraint.usernameFont)
        label.textAlignment = .center
        return label
    }()
    
    private let plusButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "AddStoryButton"), for: .normal)
        return button
    }()
    
    
    private let circleImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "StoryRing")
        return view
    }()
    
}
private extension StoriesitemCell{
    func initialeze(){
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints{ make in
            make.size.equalTo(UIConstraint.imageSize)
            make.leading.top.trailing.equalToSuperview().inset(UIConstraint.imageToCelInset)
            
        }
        contentView.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints{ make in
            make.leading.trailing.bottom.equalToSuperview().inset(UIConstraint.labelToCellInset)
            make.top.equalTo(imageView.snp.bottom).offset(UIConstraint.imageToLabelOfSet)
            
        }
        contentView.addSubview(plusButton)
        plusButton.snp.makeConstraints{ make in
            make.trailing.bottom.equalTo(imageView)
            make.size.equalTo(UIConstraint.plusButtonSize)
        }
        contentView.addSubview(circleImageView)
            circleImageView.snp.makeConstraints{ make in
                make.center.equalTo(imageView)
                make.size.equalTo(UIConstraint.circelSize)
        }
    }
}
