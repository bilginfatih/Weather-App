//
//  HomeView.swift
//  Hava Durumu
//
//  Created by Fatih Bilgin on 21.09.2022.
//

import SwiftUI
import CoreLocationUI

struct HomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        
        NavigationView {
            ZStack {
                    //MARK: Background Color
                    Color.background
                        .ignoresSafeArea()
                    
                    //MARK: Image Color
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                    
                    //MARK: House Image
                    //Image("House")
                    //    .frame(maxHeight: .infinity, alignment: .top)
                      //  .padding(.top, 187)
                    
                    VStack(spacing: -5) {
                        Text("Bursa")
                            .font(.largeTitle)
                        
                        Text("19°")
                            .font(.system(size: 96, weight: .thin))
                        
                        VStack(spacing: 5) {
                            Text("Güneşli")
                                .font(.title3.weight(.semibold))
                                .foregroundColor(.secondary)
                            
                            HStack(spacing: 20) {
                                Text("D:11°")
                                    .font(.title3.weight(.semibold))
                                Text("Y:27°")
                                    .font(.title3.weight(.semibold))
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 90)
                    
                    //MARK: Tab Bar
                    TabBar(action: {})
                }
            .navigationBarHidden(true)
            }
        }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
