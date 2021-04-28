//
//  DateExtension.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 28/4/21.
//

import SwiftUI

extension Date {
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
