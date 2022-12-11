//
//  ContentView.swift
//  Trackr
//
//  Created by dremobaba on 2022/12/11.
//

import SwiftUI

struct ContentView: View {
    let location:Location
    
    init(of location: Location) {
        self.location = location
    }
    var body: some View {
            ScrollView{
                Image(location.heroPicture)
                    .resizable()
                    .scaledToFit()
                Text(location.name)
                    .font(.largeTitle)
                    .bold()
                    .underline()
                    .multilineTextAlignment(.center)
                Text(location.country)
                    .font(.title)
                    .foregroundColor(.secondary)
                Text(location.description)
                    .padding(.horizontal)
                Text("Did you know?")
                    .font(.title3)
                    .bold()
                    .padding(.top)
                Text(location.more)
                    .padding(.horizontal)
        }
            .navigationTitle("Discover")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView(of: .example)
        }
    }
}
