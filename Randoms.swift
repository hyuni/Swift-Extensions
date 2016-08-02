//
//  SwiftRandom.swift
//
//  Created by Furkan Yilmaz on 7/10/15.
//  Copyright (c) 2015 Furkan Yilmaz. All rights reserved.
//

import UIKit

// each type has its own random

public extension Bool {
    /// SwiftRandom extension
    public static func random() -> Bool {
        return Int.random() % 2 == 0
    }
}

public extension Int {
    /// SwiftRandom extension
    public static func random(_ range: Range<Int>) -> Int {
        return random(range.upperBound, range.lowerBound)
    }

    /// SwiftRandom extension
    public static func random(_ lower: Int = 0, _ upper: Int = 100) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
}

public extension Int32 {
    /// SwiftRandom extension
    public static func random(_ range: Range<Int>) -> Int32 {
        return random(range.upperBound, range.lowerBound)
    }

    /// SwiftRandom extension
    ///
    /// - note: Using `Int` as parameter type as we usually just want to write `Int32.random(13, 37)` and not `Int32.random(Int32(13), Int32(37))`
    public static func random(_ lower: Int = 0, _ upper: Int = 100) -> Int32 {
        let r = arc4random_uniform(UInt32(Int64(upper) - Int64(lower)))
        return Int32(Int64(r) + Int64(lower))
    }
}

public extension Double {
    /// SwiftRandom extension
    public static func random(_ lower: Double = 0, _ upper: Double = 100) -> Double {
        return (Double(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
}

public extension Float {
    /// SwiftRandom extension
    public static func random(_ lower: Float = 0, _ upper: Float = 100) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
}

public extension CGFloat {
    /// SwiftRandom extension
    public static func random(_ lower: CGFloat = 0, _ upper: CGFloat = 1) -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (upper - lower) + lower
    }
}

public extension Date {
    /// SwiftRandom extension
    public static func randomWithinDaysBeforeToday(_ days: Int) -> Date {
        let today = Date()

        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)

        let r1 = arc4random_uniform(UInt32(days))
        let r2 = arc4random_uniform(UInt32(23))
        let r3 = arc4random_uniform(UInt32(59))
        let r4 = arc4random_uniform(UInt32(59))

        var offsetComponents = DateComponents()
        offsetComponents.day = Int(r1) * -1
        offsetComponents.hour = Int(r2)
        offsetComponents.minute = Int(r3)
        offsetComponents.second = Int(r4)

        guard let rndDate1 = gregorian.date(byAdding: offsetComponents, to: today) else {
            print("randoming failed")
            return today
        }
        return rndDate1
    }

    /// SwiftRandom extension
    public static func random() -> Date {
        let randomTime = TimeInterval(arc4random_uniform(UInt32.max))
        return Date(timeIntervalSince1970: randomTime)
    }

}

public extension UIColor {
    /// SwiftRandom extension
    public static func random(_ randomAlpha: Bool = false) -> UIColor {
        let randomRed = CGFloat.random()
        let randomGreen = CGFloat.random()
        let randomBlue = CGFloat.random()
        let alpha = randomAlpha ? CGFloat.random() : 1.0
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: alpha)
    }
}

public extension Array {
    /// SwiftRandom extension
    public func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

public extension ArraySlice {
    /// SwiftRandom extension
    public func randomItem() -> Element {
        let index = Int.random(startIndex, endIndex)
        return self[index]
    }
}

public extension NSURL {
    /// SwiftRandom extension
    public static func random() -> NSURL {
        let urlList = ["http://www.google.com", "http://leagueoflegends.com/", "https://github.com/", "http://stackoverflow.com/", "https://medium.com/", "http://9gag.com/gag/6715049", "http://imgur.com/gallery/s9zoqs9", "https://www.youtube.com/watch?v=uelHwf8o7_U"]
        return NSURL(string: urlList.randomItem())!
    }
}


public struct Randoms {

    //==========================================================================================================
    // MARK: - Object randoms
    //==========================================================================================================

    public static func randomBool() -> Bool {
        return Bool.random()
    }

    public static func randomInt(range: Range<Int>) -> Int {
        return Int.random(range)
    }

    public static func randomInt(lower: Int = 0, _ upper: Int = 100) -> Int {
        return Int.random(lower, upper)
    }

    public static func randomInt32(range: Range<Int>) -> Int32 {
        return Int32.random(range)
    }

    public static func randomInt32(lower: Int = 0, _ upper: Int = 100) -> Int32{
        return Int32.random(lower, upper)
    }

    public static func randomPercentageisOver(percentage: Int) -> Bool {
        return Int.random() > percentage
    }

    public static func randomDouble(lower: Double = 0, _ upper: Double = 100) -> Double {
        return Double.random(lower, upper)
    }

    public static func randomFloat(lower: Float = 0, _ upper: Float = 100) -> Float {
        return Float.random(lower, upper)
    }

    public static func randomCGFloat(lower: CGFloat = 0, _ upper: CGFloat = 1) -> CGFloat {
        return CGFloat.random(lower, upper)
    }

    public static func randomDateWithinDaysBeforeToday(days: Int) -> NSDate {
        return Date.randomWithinDaysBeforeToday(days)
    }

    public static func randomDate() -> NSDate {
        return Date.random()
    }

    public static func randomColor(randomAlpha: Bool = false) -> UIColor {
        return UIColor.random(randomAlpha)
    }

    public static func randomNSURL() -> NSURL {
        return NSURL.random()
    }

    //==========================================================================================================
    // MARK: - Fake random data generators
    //==========================================================================================================

    public static func randomFakeName() -> String {
        let firstNameList = ["Henry", "William", "Geoffrey", "Jim", "Yvonne", "Jamie", "Leticia", "Priscilla", "Sidney", "Nancy", "Edmund", "Bill", "Megan"]
        let lastNameList = ["Pearson", "Adams", "Cole", "Francis", "Andrews", "Casey", "Gross", "Lane", "Thomas", "Patrick", "Strickland", "Nicolas", "Freeman"]
        return firstNameList.randomItem() + " " + lastNameList.randomItem()
    }

    public static func randomFakeGender() -> String {
        return Bool.random() ? "Male" : "Female"
    }

    public static func randomFakeConversation() -> String {
        let convoList = ["You embarrassed me this evening.","You don't think that was just lemonade in your glass, do you?","Do you ever think we should just stop doing this?","Why didn't he come and talk to me himself?","Promise me you'll look after your mother.","If you get me his phone, I might reconsider.","I think the room is bugged.","No! I'm tired of doing what you say.","For some reason, I'm attracted to you."]
        return convoList.randomItem()
    }

    public static func randomFakeTitle() -> String {
        let titleList = ["CEO of Google", "CEO of Facebook", "VP of Marketing @Uber", "Business Developer at IBM", "Jungler @ Fanatic", "B2 Pilot @ USAF", "Student at Stanford", "Student at Harvard", "Mayor of Raccoon City", "CTO @ Umbrella Corporation", "Professor at Pallet Town University"]
        return titleList.randomItem()
    }

    public static func randomFakeTag() -> String {
        let tagList = ["meta", "forum", "troll", "meme", "question", "important", "like4like", "f4f"]
        return tagList.randomItem()
    }

    private static func randomEnglishHonorific() -> String {
        let englishHonorificsList = ["Mr.", "Ms.", "Dr.", "Mrs.", "Mz.", "Mx.", "Prof."]
        return englishHonorificsList.randomItem()
    }

    public static func randomFakeNameAndEnglishHonorific() -> String {
        let englishHonorific = randomEnglishHonorific()
        let name = randomFakeName()
        return englishHonorific + " " + name
    }

    public static func randomFakeCity() -> String {
        let cityPrefixes = ["North", "East", "West", "South", "New", "Lake", "Port"]
        let citySuffixes = ["town", "ton", "land", "ville", "berg", "burgh", "borough", "bury", "view", "port", "mouth", "stad", "furt", "chester", "mouth", "fort", "haven", "side", "shire"]
        return cityPrefixes.randomItem() + citySuffixes.randomItem()
    }
    
    public static func randomCurrency() -> String {
        let currencyList = ["USD", "EUR", "GBP", "JPY", "AUD", "CAD", "ZAR", "NZD", "INR", "BRP", "CNY", "EGP", "KRW", "MXN", "SAR", "SGD",]
        
        return currencyList.randomItem()
    }

    public enum GravatarStyle: String {
        case standard
        case mm
        case identicon
        case monsterID
        case wavatar
        case retro

        static let allValues = [standard, mm, identicon, monsterID, wavatar, retro]
    }

    public static func createGravatar(_ style: Randoms.GravatarStyle = .standard, size: Int = 80, completion: ((image: UIImage?, error: NSError?) -> Void)?) {
        var url = "https://secure.gravatar.com/avatar/thisimagewillnotbefound?s=\(size)"
        if style != .standard {
            url += "&d=\(style.rawValue.lowercased())"
        }

        let request = URLRequest(url: URL(string: url)!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 5.0)
        let session = URLSession.shared

        session.dataTask(with: request, completionHandler: {(data, response, error) in
            DispatchQueue.main.async(execute: { 
                if error == nil {
                    completion?(image: UIImage(data: data!), error: nil)
                } else {
                    completion?(image: nil, error: error)
                }
            })
        }).resume()
    }

    public static func randomGravatar(size: Int = 80, completion: ((image: UIImage?, error: NSError?) -> Void)?) {
        let options = Randoms.GravatarStyle.allValues
        Randoms.createGravatar(options.randomItem(), size: size, completion: completion)
    }
}
