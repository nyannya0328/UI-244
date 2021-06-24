//
//  Home.swift
//  UI-244
//
//  Created by nyannyan0328 on 2021/06/24.
//

import SwiftUI

struct Home: View {
    @State var selected = "p1"
    var body: some View {
        ZStack {
            GeometryReader{proxy in
                
                
                let size = proxy.size
                
                
                Image(selected)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(0)
                
            }
            .ignoresSafeArea()
            .overlay(.ultraThinMaterial)
        .colorScheme(.dark)
            
            
            
            TabView(selection:$selected){
                
                ForEach(1...6,id:\.self){index in
                    
                    
                    CrouselBodyView(index: index)
                    
                }
                
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
        }
        
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
