//
//  UserArray.swift
//  SwiftfulSwiftUiPractice
//
//  Created by apple on 06/05/25.
//


struct UserArray: Codable  {
    var users: [User]?
    var total, skip, limit: Int?
}

// MARK: - User
struct User: Codable, Identifiable {
    var id: Int?
    var firstName, lastName, maidenName: String?
    var age: Int?
    var email, phone, username, password: String?
    var birthDate: String?
    var image: String?
    var bloodGroup: String?
    var height, weight: Double?
    
    var work:String{
        "Worker as some job"
    }
    
    var education:String{
        "Some education"
    }
    
    var aboutMe:String{
        "This is sentance for about me dummy, This is sentance for about me dummy longer"
    }
    
    var basics:[UserInterst]{
       [
        UserInterst(iconName: "ruler", emoji: nil, text: "\(height ?? 0)"),
        UserInterst(iconName: "graduationcap", emoji: nil, text: "\(education)"),
        UserInterst(iconName: "wineglass", emoji: nil, text: "Socially"),
        UserInterst(iconName: "moon.stars.fill", emoji: nil, text: "Virgo")
       ]
    }
    
    var interests:[UserInterst]{
       [
        UserInterst(iconName: nil, emoji: "👟", text: "Running"),
        UserInterst(iconName: nil, emoji: "🏋️‍♂️", text: "Gym"),
        UserInterst(iconName: nil, emoji: "🎧", text: "Music"),
        UserInterst(iconName: nil, emoji: "🥘", text: "Cooking")

       ]
    }
    
    var images:[String]{
        [
            "https://picsum.photos/500/500",
            Constants.randomImage,
            "https://picsum.photos/700/700"
        ]
    }
    
    static var mock: User {
        User(
            id: 444,
            firstName: "Vishal",
            lastName: "Rana",
            maidenName: "",
            age: 35,
            email: "vishal@test.com",
            phone: "",
            username: "",
            password: "",
            birthDate: "",
            image: Constants.randomImage,
            bloodGroup: "",
            height: 100.0,
            weight: 25.0
        )
    }
}
