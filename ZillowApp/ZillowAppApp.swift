//
//  ZillowAppApp.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 1.12.24..
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct ZillowAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject private var locationManager = LocationManager()
    @StateObject var authView = AuthenticationView()

    var body: some Scene {
        WindowGroup {
            InitView()
                .environmentObject(locationManager)
                .environmentObject(authView)
        }
    }
}

class AppDelegate : NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    @available(iOS 9.0, *)
    
    func application(_ application : UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    
    }
}
