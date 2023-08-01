//
//  ContentView.swift
//  TabBarAnimated
//
//  Created by Cristina on 2023-08-01.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    // holds the currently selected tab
    @State private var tabSelected: Tab = .house
    
    // computed property - gets the text to display for the currently selected tab
    private var tabText: String {
            TabBarView(selectedTab: $tabSelected).tabText(tabSelected)
        }
     
    // initializer -  hides the default UITabBar
    init() {
            UITabBar.appearance().isHidden = true
        }
        
    // MARK: - Body
    var body: some View {
        ZStack {
                    VStack {
                        TabView(selection: $tabSelected) {
                            ForEach(Tab.allCases, id: \.rawValue) { tab in
                                HStack {
                                    // image representing the current tab
                                    Image(systemName: tab.rawValue)
                                    // text to display for the current tab
                                    Text(tabText)
                                        .bold()
                                        // ensures that the text change is not animated when the tab changes
                                        .animation(nil, value: tabSelected)
                                }
                                .tag(tab)
                                
                            }
                        } // TabView
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hides the tab indicator
                        .background(TabBarView(selectedTab: $tabSelected).tabColor.opacity(0.3)) // Use the tabColor directly
                    } // VStack
                    VStack { // places the TabBarView at the bottom of the screen
                        Spacer()
                        TabBarView(selectedTab: $tabSelected)
                    } // VStack
                }
            }
         }

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
