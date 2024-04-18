//
//  AppDelegate.swift
//  RickAndMortyZaraUIKit
//
//  Created by Lucas Romero Magaña on 16/4/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        CharacterListWireFrame().present()
        return true
    }
}
