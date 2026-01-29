import UIKit

let randomStorySelection : Int = Int.random(in: 1...3)

/// Strings cannot be empty. They must have a value.
func generateMadLib(noun1: String,
                    noun2: String,
                    adjective1: String,
                    adjective2: String,
                    adjective3: String,
                    adjective4: String,
                    adjective5: String,
                    place1: String,
                    place2: String,
                    pieceOfClothing:String,
                    bodyPart1: String,
                    bodyPart2: String,
                    bodyPart3: String ) -> String {
    
    
    if noun1.isEmpty || noun2.isEmpty || adjective1.isEmpty || adjective2.isEmpty || adjective3.isEmpty || adjective4.isEmpty || adjective5.isEmpty || place1.isEmpty || place2.isEmpty || pieceOfClothing.isEmpty || bodyPart1.isEmpty || bodyPart2.isEmpty ||
        bodyPart3.isEmpty {
        return "Invalid input"
    }
    
    //Create arrays for place holders
    let nouns = [noun1, noun2]
    let adjectives = [adjective1, adjective2, adjective3, adjective4, adjective4, adjective5]
    let places = [place1, place2]
    let bodyParts = [bodyPart1, bodyPart2, bodyPart3]
    
    //Take the arrays and shuffle them
    let shuffledNouns = nouns.shuffled()
    let shuffledAdjectives = adjectives.shuffled()
    let shuffledPlaces = places.shuffled()
    let shuffledBodyParts = bodyParts.shuffled()
    
    // Select random elements using indexes
    let randomNoun1 = shuffledNouns[0]
    let randomNoun2 = shuffledNouns[1]
    
    let randomAdjective1 = shuffledAdjectives[0]
    let randomAdjective2 = shuffledAdjectives[1]
    let randomAdjective3 = shuffledAdjectives[2]
    let randomAdjective4 = shuffledAdjectives[3]
    let randomAdjective5 = shuffledAdjectives[4]
    
    let randomPlace1 = shuffledPlaces[0]
    let randomPlace2 = shuffledPlaces[1]
    
    let randomBodyPart1 = shuffledBodyParts[0]
    let randomBodyPart2 = shuffledBodyParts[1]
    let randomBodyPart3 = shuffledBodyParts[2]
    
    
    var madLib: String
    
    switch randomStorySelection {
    case 1:
        madLib = "Every year, you should go visit the doctor. It is a very \(randomAdjective1) visit. Usually, you have to skip going to \(randomPlace1) to go. Your doctor is usually a/an \(randomAdjective2) man or woman who is wearing a/an \(randomAdjective3) \(pieceOfClothing). They will look at your \(randomBodyPart1), \(randomBodyPart2), and \(randomBodyPart3). Sometimes, they can be very \(randomAdjective4). Afterwards, they will give you a \(randomNoun1) and a \(randomNoun2) and your mom or dad will take you to \(randomPlace2) as a treat. All in all, the docotor's office isn't so \(randomAdjective5)!"
    case 2:
       madLib = "Every year, you should go visit the zoo. It is a very \(randomAdjective1) trip. Usually, you have to skip going to \(randomPlace1) to go. The zookeeper is usually a/an \(randomAdjective2) man or woman who is wearing a/an \(randomAdjective3) \(pieceOfClothing). They will show you a lion’s \(randomBodyPart1), a monkey’s \(randomBodyPart2), and an elephant’s \(randomBodyPart3). Sometimes, the animals can be very \(randomAdjective4). Afterwards, they will give you a \(randomNoun1) and a \(randomNoun2), and your mom or dad will take you to \(randomPlace2) as a treat. All in all, the zoo isn’t so \(randomAdjective5)!"
    case 3:
      madLib = "Every year, you should go visit the school principal. It is a very \(randomAdjective1) meeting. Usually, you have to skip going to \(randomPlace1) to go. The principal is usually a/an \(randomAdjective2) man or woman who is wearing a/an \(randomAdjective3) \(pieceOfClothing). They will stare at your \(randomBodyPart1), tap your \(randomBodyPart2), and point at your \(randomBodyPart3). Sometimes, they can be very \(randomAdjective4). Afterwards, they will give you a \(randomNoun1) and a \(randomNoun2), and your mom or dad will take you to \(randomPlace2) as a treat. All in all, the principal’s office isn’t so \(randomAdjective5)!"
    default :
       return "If you are seeing this something went wrong!"
    }
    
    return madLib
    
}


print(generateMadLib(noun1: "candy", noun2: "sticker", adjective1: "big", adjective2: "fat", adjective3: "gross", adjective4: "shiny", adjective5: "stinky", place1: "school", place2: "home", pieceOfClothing: "shirt", bodyPart1: "arm", bodyPart2: "leg", bodyPart3: "head"))





