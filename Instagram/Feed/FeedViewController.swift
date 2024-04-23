//
//  FeedViewController.swift
//  Instagram
//
//  Created by Никита  on 23.04.2024.
//

import SnapKit
import UIKit


class FeedViewController: UIViewController {
    
    //MARK: - View lifecycle
    // Создаем свойство для хранения LogoView
    private let logoView = LogoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        initializer()
    }
    
    //MARK: - Private properties
    private let tableView = UITableView()
    private var items: [FeedItemType] = [
        .stories([
            FeedStoriesItemCellInfo(image: UIImage(named: "Image")!, username: "userАня", isAddButtonVisiable: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "Image")!, username: "userАня", isAddButtonVisiable: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "Image")!, username: "userАня", isAddButtonVisiable: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "Image")!, username: "userАня", isAddButtonVisiable: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "Image")!, username: "userАня", isAddButtonVisiable: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "Image")!, username: "userАня", isAddButtonVisiable: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "Image")!, username: "userАня", isAddButtonVisiable: false, isNewStory: true),
        ]),
        .post(
            FeedPostItemPost(
                userName: "Аня Ревина",
                userImage: UIImage(named: "Image")!,
                postSubtile: "Я покушала кашу",
                postImage: UIImage(named: "Image")!,
                numberOfLikes: 98,
                comment: CommentshortInfo(username: "Мама", commntText: "Вау! Анютка, молодец!")
            )
        ),
        .post(
            FeedPostItemPost(
                userName: "Иван Иванов",
                userImage: UIImage(named: "Image")!,
                postSubtile: "Сегодня был замечательный день!",
                postImage: UIImage(named: "Image")!,
                numberOfLikes: 205,
                comment: CommentshortInfo(username: "Петр", commntText: "Классный снимок!")
            )
        ),
        .post(
            FeedPostItemPost(
                userName: "Елена Петрова",
                userImage: UIImage(named: "Image")!,
                postSubtile: "Новая книга, которую я читаю, просто потрясающая!",
                postImage: UIImage(named: "Image")!,
                numberOfLikes: 67,
                comment: CommentshortInfo(username: "Алексей", commntText: "Подскажи, пожалуйста, название!")
            )
        )
    ]
}

private extension FeedViewController {
    func initializer() {
        view.backgroundColor = .white
        // Устанавливаем левую кнопку навигации
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItems = makeRigthBarButton()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self))
        tableView.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell.self))
        tableView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
            
        }
    }
    
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        // Добавляем LogoView в иерархию представлений
        view.addSubview(logoView)
        // Создаем UIBarButtonItem с кастомным видом LogoView
        let logoBarButtonItem = UIBarButtonItem(customView: logoView)
        
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), primaryAction: nil, menu: makeDropDownMenu())
        return [logoBarButtonItem, dropDownButtonItem]
    }
    
    func makeRigthBarButton() -> [UIBarButtonItem]{
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didTapPlusButton))
        let directButtonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(didTapdirectButton))
        return [directButtonItem, addBarButtonItem]
    }
    
    @objc func didTapPlusButton(){
        print("didTapPlusButton")
    }
    
    @objc func didTapdirectButton(){
        print("didTapdirectButton")
    }
    
    func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Подписки", image: UIImage(systemName: "person.2")) { _ in
            print("subs")
        }
        let favsItem = UIAction(title: "Избранное", image: UIImage(systemName: "star")) { _ in
            print("favs")
        }
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
}

extension FeedViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item{
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self), for: indexPath) as! FeedStoriesSetCell
            cell.configure(with: info)
            return cell
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self), for: indexPath ) as! FeedPostCell
            cell.configure(with: post)
            return cell
        }
        
    }
    
    
    
}

