//
//  MainTabView.swift
//  BumpBuddy
//
//  Created by Bolanle Adisa on 11/17/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var showMotivation: Bool = false
    @State var selection = 1
    
    var body: some View {
        NavigationView {
            TabView {
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
                
                PregnancyTrackerView()
                    .tabItem {
                        Label("Tracker", systemImage: "calendar")
                    }

                HealthInsightsView()
                    .tabItem {
                        Label("Health", systemImage: "staroflife.fill")
                    }

                AppointmentSchedulerView()
                    .tabItem {
                        Label("Appointments", systemImage: "clock.fill")
                    }.toolbar(.hidden, for: .navigationBar)

                DueDateEstimatorView()
                    .tabItem {
                        Label("Due Date", systemImage: "heart.circle.fill")
                    }

                
            }
            .navigationBarTitle("Bump Buddy", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                showMotivation.toggle()
            }) {
                Image(systemName: "quote.bubble")
            })
            .sheet(isPresented: $showMotivation) {
                WeeklyMotivationView()
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
