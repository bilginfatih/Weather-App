//
//  TabBar.swift
//  Hava Durumu
//
//  Created by Fatih Bilgin on 21.09.2022.
//

import SwiftUI
import CoreLocationUI

struct TabBar: View {
    var action: () -> Void
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        ZStack {
            //MARK: Arc Shape
            Arc()
                .fill(Color.tabBarBackground)
                .frame(height: 88)
                .overlay {
                    //MARK: Arc Border:
                    Arc()
                        .stroke(Color.tabBarBorder, lineWidth: 0.5)
                }
            // MARK: Tab Items
            HStack {
                // MARK: Expand Button
             /*   Button{
                    action()
                    locationManager.requestLocation()
                    print("fatih")
                } label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44, height: 44)
                }*/
                
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                 .cornerRadius(30)
                 .symbolVariant(.fill)
                 .foregroundColor(.white)
                 .preferredColorScheme(.dark)
                 .labelStyle(.iconOnly)
                 .tint(.black)
                 .blendMode(.lighten)
                 
                
                
                
                
                Spacer()
                
                // MARK: Navigation Button
                NavigationLink{
                    
                } label: {
                    Image(systemName: "list.star")
                        .frame(width: 44, height: 44)
                }
            }
            .font(.title2)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 20, leading: 32, bottom: 24, trailing: 32))
            
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(action: {})
            .preferredColorScheme(.dark)
    }
}
