//
//  DetailRowView.swift
//  RickAndMortyZaraUIKit
//
//  Created by Lucas Romero Magaña on 16/4/24.
//

import Foundation
import UIKit

final class DetailRowView: UIView, Nibbable {

    // MARK: - Properties
    var view: UIView!

    @IBOutlet weak var lbValue: UILabel!
    @IBOutlet weak var lbTopic: UILabel!

    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        viewFromNib()
    }
}
