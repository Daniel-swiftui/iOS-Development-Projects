//  Scope Lab #1: Scope Demo
//
//  # Instructions:
//  - With a partner, throughly annotate this file to describe
//    the scope of each and every variable and constant,
//    including those declared as part of function parameters.
//  - Add comments at the end of each line with a new variable
//    to annotate their scope.
//  - We will do the first few together.


import Foundation

let appName: String = "Scope Explorer" //Global, available anywhere in the project
var globalUserCount: Int = 0 //Global, available anywhere in the project


@MainActor // Ignore this
class ScopeDemoViewModel { //Global, available anywhere in the project

    static let maxCachedItems: Int = 100 //Global through the type ScopeDemoViewModel without needing an instance
    static var sharedInstanceCount: Int = 0 //Global through the type ScopeDemoViewModel without needing an instance

    let id: UUID //Global through ScopeDemoViewModel needing an instance
    var title: String //Global through ScopeDemoViewModel needing an instance
    private var isDirty: Bool = false //Global through ScopeDemoViewModel needing an instance
    fileprivate var lastSyncDate: Date //Global through  ScopeDemoViewModel needing an instance
    private var retryCount: Int = 0 //Global through ScopeDemoViewModel needing an instance and can only be read from the same source file
    public var isEnabled: Bool = true //Global through ScopeDemoViewModel needing an instance and can be read and modified from any source file with in its defining module

    var isSynced: Bool { //Global through ScopeDemoViewModel
        return !isDirty
    }

    private var shouldRetry: Bool { //Global through ScopeDemoViewModel can only be read from the same source file
        return retryCount < 3 && !isSynced
    }

    static var descriptionText: String { //Global through the type ScopeDemoViewModel without needing an instance
        return "This type demonstrates many different scopes."
    }

    struct SyncSettings { //Local available only through ScopeDemoviewModel
        let maxAttempts: Int //local available only through SyncSettings
        var delayBetweenAttempts: TimeInterval //local available only through SyncSettings
        private(set) var lastUsedVersion: String//local available only through SyncSettings this is limited to SyncSettings

        mutating func markUsed(version: String) { //Local available through SyncSettings function
            lastUsedVersion = version//local available only through the markUsed function
        }
    }

    var syncSettings: SyncSettings//Global through ScopeDemoViewModel

    init(title: String) {//local avilable through ScopeDemoViewModel
        self.id = UUID()//local available through the initializer
        self.title = title//local available through the initializer
        self.syncSettings = SyncSettings(//local available through the initializer
            maxAttempts: 3,//Global available where ever SyncSettings is used
            delayBetweenAttempts: 2.0,//Global available where ever SyncSettings is used
            lastUsedVersion: "1.0"//Global available where ever SyncSettings is used
        )
        self.lastSyncDate = Date()//local available through the initializer

        let initialStatusMessage = "Created view model with title: \(title)"//local available through the initializer
        print(initialStatusMessage)

        ScopeDemoViewModel.sharedInstanceCount += 1//local available through the initializer since it is being modified
    }

    convenience init() {//Global availavle throught ScopeDemoViewModel
        self.init(title: "Untitled")//local availble through the initializer
    }

    func performSync() {//Local available through ScopeDemoViewModel
        let startTime = Date()//local availabe through preformSync function
        var attempts = 0 //local availabe through preformSync function
        let retryCount = 0 //local availabe through preformSync function
        print("Local retryCount (shadowing property): \(retryCount)")

        func attemptSyncOnce() -> Bool {//local available through preformSync function
            attempts += 1 //local availabe through attemptSyncOnce function
            globalUserCount += 1 //local availabe through preformSync function

            let syncId = UUID()//local availabe through preformSync function
            print("Attempt \(attempts) with id \(syncId)")
            return Bool.random()
        }

        while attempts < syncSettings.maxAttempts {//local available through preformSync function
            let success = attemptSyncOnce()//local available through attempts while loop
            if success {//local available through attempts while loop
                lastSyncDate = Date()//local available through if statement
                isDirty = false//local available through if statement
                break
            }
        }

        let elapsed = Date().timeIntervalSince(startTime)//local available through preformSync function
        print("Sync finished in \(elapsed) seconds")
    }

    private func logStatusChange(from old: String, to new: String) { //Global available through ScopeDemoViewModel
        let logMessage = "Status changed from \(old) to \(new)"//Local available through logStatusChange
        print(logMessage)
    }

    func updateTitle(to newTitle: String, animated: Bool) {
        let oldTitle = title
        title = newTitle
        isDirty = true

        if animated {
            animateTitleChange(from: oldTitle, to: newTitle)
        }
    }

    private func animateTitleChange(from old: String, to new: String) {
        let animationDuration: TimeInterval = 0.25

        let animations = {
            let transitionText = "\(old) → \(new)"
            print("Animating title change: \(transitionText)")
        }

        performAnimation(duration: animationDuration, animations: animations)
    }

    private func performAnimation(duration: TimeInterval, animations: () -> Void) {
        print("Starting animation for \(duration) seconds")
        animations()
        print("Animation complete")
    }

    static func resetSharedInstanceCount() {
        sharedInstanceCount = 0
    }

    static func makeSampleViewModels() -> [ScopeDemoViewModel] {
        let titles = ["Home", "Profile", "Settings", "About"]
        var result: [ScopeDemoViewModel] = []

        for name in titles {
            let model = ScopeDemoViewModel(title: name)
            result.append(model)
        }

        return result
    }
    
    fileprivate func markAsDirtyForTesting() {
        isDirty = true
    }
}

fileprivate extension ScopeDemoViewModel {
    func debugPrintState() {
        print("Debug id: \(id)")
        print("Debug lastSyncDate: \(String(describing: lastSyncDate))")
    }
}

@MainActor // Ignore this
func runScopeDemo() {
    let models = ScopeDemoViewModel.makeSampleViewModels()
    print("Created \(models.count) models in \(appName)")
    print("Global user count: \(globalUserCount)")

    if let first = models.first {
        first.performSync()
    }
}
