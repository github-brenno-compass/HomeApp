//
//  ContentView.swift
//  Sample
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import NavigationKit
import GithubKit

struct ContentView: View {

    @Environment(\.viewResolver) var viewResolver

    var body: some View {
        viewResolver(HomeAppScene.home(
            HomeAppScene.Home()
        ))
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
