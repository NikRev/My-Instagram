import UIKit

struct FeedPostItemPost{
    let userName:String
    let userImage: UIImage
    let postSubtile:String
    let postImage:UIImage
    let numberOfLikes:Int
    let comment:CommentshortInfo?
}

struct CommentshortInfo{
    let username:String
    let commntText:String
}
