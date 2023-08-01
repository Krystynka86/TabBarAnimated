//
//  TabBarView.swift
//  TabBarAnimated
//
//  Created by Cristina on 2023-08-01.
//

import SwiftUI

// enumeration to represent different tabs
enum Tab: String, CaseIterable {
    case house
    case message
    case person
    case heart
    case gearshape
}

struct TabBarView: View {
    // MARK: - Properties
    // represents the currently selected tab
    @Binding var selectedTab: Tab
    
    // generates the image name with ".fill" appended for the currently selected tab
        private var fillImage: String {
            selectedTab.rawValue + ".fill"
        }
    
    // computed property - returns the color associated with the selected tab
     var tabColor: Color {
            switch selectedTab {
            case .house:
                return .brown
            case .message:
                return .indigo
            case .person:
                return .green
            case .heart:
                return .red
            case .gearshape:
                return .purple
            }
        }
    
    // returns the text to display for each tab
     func tabText(_ tab: Tab) -> String {
            switch tab {
            case .house:
                return "Home"
            case .message:
                return "Message"
            case .person:
                return "Profile"
            case .heart:
                return "Favorites"
            case .gearshape:
                return "Settings"
            }
        }
    
    // MARK: - Body
    var body: some View {
        VStack {
                    HStack {
                        // Iterate through all the tabs to display the tab icons and text
                        ForEach(Tab.allCases, id: \.rawValue) { tab in
                            Spacer()
                            VStack(spacing: 5) {
                                
                                // Display the tab icon, and if it's the selected tab use the filled version
                                Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                                    .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                                    .foregroundColor(tab == selectedTab ? tabColor : .gray)
                                    .font(.system(size: 20))
                                    .onTapGesture {
                                        // when a tab is tapped, set the selectedTab to that tab, with a slight animation.
                                        withAnimation(.easeInOut(duration: 0.1)) {
                                            selectedTab = tab
                                        }
                                    }
                            // displays the tab text below the icon
                            Text(tabText(tab))
                                .font(.caption)
                                .foregroundColor(tab == selectedTab ? tabColor : .gray)
                              }
                            
                            Spacer()
                        }
                    } //: HStack
                    .frame(width: nil, height: 60)
                    .background(.thinMaterial)
                    .cornerRadius(8)
                    .padding()
                } //: VStack
    }
}

// MARK: - Preview
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: .constant(.house))
    }
}
