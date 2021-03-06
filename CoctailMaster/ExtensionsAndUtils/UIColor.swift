//
//  Colors.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 08.04.2021.
//

import UIKit

extension UIColor {

    static func color(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13, *) {
            return UIColor { traitCollection in
                return traitCollection.userInterfaceStyle == .dark ? dark : light
            }
        } else {
            return light
        }
    }

    convenience init(_ hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        let length = hexSanitized.count

        var rgb: UInt64 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        if Scanner(string: hexSanitized).scanHexInt64(&rgb) {
            if length == 6 {
                r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
                g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
                b = CGFloat(rgb & 0x0000FF) / 255.0
            } else if length == 8 {
                r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
                g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
                b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
                a = CGFloat(rgb & 0x000000FF) / 255.0
            } else {
                self.init()
            }

            self.init(red: r, green: g, blue: b, alpha: a)
        } else {
            self.init()
        }
    }

    static let commonBlue = UIColor.color(light: UIColor("#53ADF0"), dark: .systemGray)
    static let lightBlue = UIColor.color(light: UIColor("#d6ecfc"), dark: .systemGray)
    static let lightMint = UIColor.color(light: UIColor("#cbedcf"), dark: systemGray)
    static let commonBackground = UIColor.color(light: .white, dark: .darkText)
}
