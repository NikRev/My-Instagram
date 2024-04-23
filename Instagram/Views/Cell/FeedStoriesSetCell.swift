import UIKit
import SnapKit


class FeedStoriesSetCell:UITableViewCell, UICollectionViewDelegate{
   
    //MARK: - Public
    func configure(with info: FeedStoriesCellInfo){
        self.items = info
        collectiomView.reloadData()
        //print(info)
    }
    
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Private Enum
    
    private enum UIConstraint{
        static let collectionViewHeigth:CGFloat = 106
        static let cellWidth:CGFloat = 72
        static let cellHeight:CGFloat = 98
    }
    
    
    
    //MARK: - Private Properties
    private var collectiomView: UICollectionView!
    private var items: FeedStoriesCellInfo = []
    
}

private extension FeedStoriesSetCell{
    
    func initialize(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectiomView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectiomView.dataSource = self
        collectiomView.register(StoriesitemCell.self, forCellWithReuseIdentifier: String(describing: StoriesitemCell.self))
        collectiomView.delegate = self
        //collectiomView.separatorStyle = .none
        collectiomView.showsHorizontalScrollIndicator = false
        contentView.addSubview(collectiomView)
        collectiomView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
            make.height.equalTo(UIConstraint.collectionViewHeigth)
        }
    }
    
}

extension FeedStoriesSetCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: StoriesitemCell.self), for: indexPath) as! StoriesitemCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
}

extension FeedStoriesSetCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstraint.cellWidth , height: UIConstraint.cellHeight)
    }
}
