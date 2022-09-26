//
//  ContentView.swift
//  Hava Durumu
//
//  Created by Fatih Bilgin on 21.09.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Kordinatlar: \(location.longitude),\(location.latitude)")
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    HomeView()
                        .environmentObject(locationManager)
                }
            }
                     
        }
        .preferredColorScheme(.dark)
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
