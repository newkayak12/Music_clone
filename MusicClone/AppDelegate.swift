//
//  AppDelegate.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/06.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

   

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let isFirst: Bool = UserDefaults.standard.bool(forKey: "lauchBefore");
                       
                       
        print("isFirst: \(isFirst)")
        if true{
            let defaultSet: [SortType] = [
                SortType(name: "Playlits", image:  "music.note.list", isShow: true),
                SortType(name: "Artists", image: "music.mic", isShow: true),
                SortType(name: "Albums", image: "square.stack", isShow: false),
                SortType(name: "Songs", image: "music.note", isShow: false),
                SortType(name: "TV & Movies", image: "music.note.list", isShow: false),
                SortType(name: "Music Videos", image: "music.note.tv", isShow: false),
                SortType(name: "Genres", image: "guitars", isShow: true),
                SortType(name: "Compiliations", image: "music.quarternote.3", isShow: false),
                SortType(name: "Downloaded", image: "music.note.list", isShow: false),
                SortType(name: "Home Sharing", image: "music.note.house", isShow: false),
            ];
            let encoder = JSONEncoder()
            
            if let encodedList = try? encoder.encode(defaultSet){
                dump(encodedList)
                UserDefaults.standard.set(encodedList, forKey: "librarySection")
            }
          
            
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

