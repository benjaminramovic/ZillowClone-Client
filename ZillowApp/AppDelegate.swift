//
//  AppDelegate.swift
//  ZillowApp
//
//  Created by Neuer Benutzer on 20.12.24..
//

import UIKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}

