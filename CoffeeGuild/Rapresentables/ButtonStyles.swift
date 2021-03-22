//
//  ButtonStyles.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 22/3/21.
//

import SwiftUI

struct NavLinkBtn: ButtonStyle {
    public func makeBody(configuration: NavLinkBtn.Configuration) -> some View {
        configuration.label
    }
}
