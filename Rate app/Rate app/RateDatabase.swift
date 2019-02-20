class UserDetails {
    
    var UserID: Int
    var Firstname: String?
    var Lastname: String?
    var Username: String?
    var Password: String?
    var Email: String?
    var PostId: Int
    
    init(UserID: Int, Firstname: String, Lastname: String?, Username: String?, Password: String?, Email: String?, PostId: Int) {
        self.UserID = UserID
        self.Firstname = Firstname
        self.Lastname = Lastname
        self.Username = Username
        self.Password = Password
        self.Email = Email
        self.PostId = PostId
    }
}
