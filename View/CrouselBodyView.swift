//
//  CrouselBodyView.swift
//  UI-244
//
//  Created by nyannyan0328 on 2021/06/24.
//

import SwiftUI

struct CrouselBodyView: View {
    var index : Int
    
    @State var offset : CGFloat = 0
    var body: some View {
        GeometryReader{proxy in
            
            
            let size = proxy.size
            
            ZStack{
                
                Image("p\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - 9, height: size.height / 1.2)
                    .cornerRadius(10)
                
                
                VStack{
                    
                    
                    VStack(spacing:10){
                        
                        
                        Text("Human Intergration SuperViser")
                            .font(.title2.italic())
                            .kerning(1.5)
                        
                        
                        Text("Animal Power")
                            .font(.title3.italic())
                            .kerning(1.5)
                            .foregroundStyle(.secondary)
                        
                        
                    }
                    .foregroundStyle(.white)
                    .padding(.top)
                    Spacer(minLength: 0)
                    
                    
                    VStack(alignment:.leading,spacing:10){
                        
                        
                        
                        HStack(spacing:10){
                            
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                            
                            
                            VStack{
                                
                                
                                
                                Text("Girl")
                                    .font(.title2.italic())
                                    .foregroundStyle(.black)
                                
                                Text("So Cute!")
                                    .foregroundColor(.secondary)
                                
                                
                                
                            }
                            .foregroundStyle(.black)
                            
                            
                            
                        }
                        
                        
                        HStack{
                            
                            
                            VStack(spacing:10){
                                
                                
                                Text("1300")
                                    .font(.title2.bold())
                                    
                                
                                Text("Posts")
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack(spacing:10){
                                
                                
                                Text("3100")
                                    .font(.title2.bold())
                                    
                                
                                Text("Following")
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            
                            VStack(spacing:10){
                                
                                
                                Text("1500")
                                    .font(.title2.bold())
                                    
                                
                                Text("Followers")
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            
                            
                        }
                        .padding()
                        
                    }
                    .padding(.top,20)
                    .padding(.horizontal,10)
                    .background(.white,in: RoundedRectangle(cornerRadius: 5))
                    
                }
                
            }
            .frame(width: size.width - 9, height: size.height / 1.2)
            .frame(width: size.width, height: size.height)
            
        }
        .tag("p\(index)")
        
        .rotation3DEffect(.init(degrees: getIndex() * 90), axis: (x: 0, y: 1, z: 0), anchor: offset > 0 ? .leading : .trailing, anchorZ: 0, perspective: 0.8)
        
        
        .modifier(ScrollViewOffsetModifier(offset: $offset, anchorpoint: .leading))
        
        
    }
    
    func getIndex()->CGFloat{
        
        
        let progress = -offset / UIScreen.main.bounds.width
        
        return progress
        
    }
}

struct CrouselBodyView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
