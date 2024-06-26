//
//  BaseViewController.swift
//  RickAndMortyZaraUIKit
//
//  Created by Lucas Romero Magaña on 16/4/24.
//

import UIKit
import Combine

class BaseViewController: UIViewController {
    private enum Constants {
        static var loadingTitle = "Please wait..."
        static var loadingX = 10.0
        static var loadingY = 5.0
        static var loadingHeighWeigt = 50.0
    }

    func showLoading() {
        let alert = UIAlertController(title: nil, message: Constants.loadingTitle, preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: Constants.loadingX,
                                                                     y: Constants.loadingY,
                                                                     width: Constants.loadingHeighWeigt,
                                                                     height: Constants.loadingHeighWeigt))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }

    func hideLoading() {
        dismiss(animated: false, completion: nil)
    }
}
