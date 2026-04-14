//
//  TravelBookingServiceModel.swift
//  SOLID Lab
//
//  Created by Daniel Umpierrez on 3/18/26.
//

import Foundation

// Destination, payment method, staylength, userdata(username, password, email, name)

class User {
    var name: String
    var email: String
    var phoneNumber: String
    
    init(name: String, email: String, phoneNumber: String) {
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
    }
}

struct Confirmation {
    var name: User
    var confirmationNumber: String
}

//Single Responsibility Principle
protocol UserDataStore {
    func saveUser(_ user: User)
    func fetchUser(withId id: String) -> User?
}

class UserDatabase: UserDataStore {
    func saveUser(_ user: User) {
        //Save user to database
    }
    
    func fetchUser(withId id: String) -> User? {
        //Fetch user from database
        return nil
    }
}

// Open/Closed Principle
protocol DestinationConfirmation {
    func confirmDestination(_ confirmation: Confirmation)
}
class emailConfirmation: DestinationConfirmation {
    func confirmDestination(_ confirmation: Confirmation) {
        // Send Email confirmation
    }
}
class textConfirmation: DestinationConfirmation {
    func confirmDestination(_ confirmation: Confirmation) {
        // Send Text confirmation
    }
}
// Dependency Inversion
class bookingConfirmation {
    private let confirmationAlert: DestinationConfirmation
    init(confirmationAlert: DestinationConfirmation) {
        self.confirmationAlert = confirmationAlert
    }
    func confirmBooking(_ confirmation: Confirmation) {
        confirmationAlert.confirmDestination(confirmation)
    }
}
// LisKov Substitution Principle
class PremiumUser: User {
    var premiumTier: String
    
    init(name: String, email: String, phoneNumber: String, premiumTier: String) {
        self.premiumTier = premiumTier
        super.init(name: name, email: email, phoneNumber: phoneNumber)
    }

}

// Interface Segregation Principle
protocol UserFetchable {
    func fetchUsers() -> [User]
}
