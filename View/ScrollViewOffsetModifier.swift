//
//  ScrollViewOffsetModifier.swift
//  UI-244
//
//  Created by nyannyan0328 on 2021/06/24.
//

import SwiftUI

struct ScrollViewOffsetModifier: ViewModifier {
    @Binding var offset : CGFloat
    var anchorpoint:Ancohor = .top
    func body(content: Content) -> some View {
        content
            .overlay(
            
                GeometryReader{proxy ->Color in
                
                
                let frame = proxy.frame(in: .global)
                
                
                DispatchQueue.main.async {
                    
                    switch anchorpoint {
                    case .top:
                        offset = frame.minY
                    case .bottome:
                        offset = frame.maxY
                    case .trailing:
                        offset = frame.maxX
                    case .leading:
                        offset = frame.minX
                    }
                    
                }
                
                return Color.clear
                
                
            }
            
            
            )
    }
}


enum Ancohor{
    
    case top
    case bottome
    case trailing
    case leading
}
