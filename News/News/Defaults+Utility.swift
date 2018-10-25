import Foundation


//extensions!!!!!!!!!!!!!
extension UserDefaults {
    static let postCountKey = "postCount"
    static let grayKey = "gray"
    static let includeKey = "include"
    
    static var postCount: Int {
        get {
            let result = UserDefaults.standard.integer(forKey: postCountKey)
            return result == 0 ? 20 : result
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: postCountKey)
        }
    }
}
