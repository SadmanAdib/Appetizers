//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Sadman Adib on 25/7/22.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
    
}
