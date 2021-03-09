//
//  ContentView.swift
//  Shared
//
//  Created by Chris Martin on 3/8/21.
//

import SwiftUI
import GoogleAnalytics

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                GAI.sharedInstance()?.logger.info("Testing")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
