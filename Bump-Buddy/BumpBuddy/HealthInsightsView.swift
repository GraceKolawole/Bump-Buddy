//
//  HealthInsightsView.swift
//  BumpBuddy
//
//  Created by Bolanle Adisa on 11/17/23.
//

import SwiftUI

struct HealthInsightsView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("mumappbackground2") // Replace with your image name
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Spacer()
                        .frame(height: 50)
                    Link(destination: URL(string: "https://www.thesource.org/blog?gclid=CjwKCAiAx_GqBhBQEiwAlDNAZpXtqkkfl6WwDMRm3MBRLtOi-4K35E3NG7x9dRKTfAWUKAkD8-S3uxoCQkIQAvD_BwE")!,
                         label:{
                        Label(
                            title: { Text("Pregnancy Guild: The Source").bold()
                            },
                            icon: {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 22, weight: .bold, design: .default))
                            })
                    })
                    .frame(width: 250, height: 50, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
                    Spacer()
                        .frame(height: 100)
                    Link(destination: URL(string: "https://data.unicef.org/topic/maternal-health/antenatal-care/")!,
                         label:{
                        Label(
                            title: { Text("UNICEF: Antenatal care").bold()
                            },
                            icon: {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 22, weight: .bold, design: .default))
                            })
                    })
                    .frame(width: 250, height: 50, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Spacer()
                        .frame(height: 100)
                    Link(destination: URL(string: "https://health.gov/myhealthfinder/pregnancy/doctor-and-midwife-visits/have-healthy-pregnancy#take-action-tab")!,
                         label:{
                        Label(
                            title: { Text("My Health Finder: Healthy Pregnancy").bold()
                            },
                            icon: {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 22, weight: .bold, design: .default))
                            })
                    })
                    .frame(width: 250, height: 50, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
                    Spacer()
                        .frame(height: 100)
                    Link(destination: URL(string: "https://www.marchofdimes.org/find-support/topics/postpartum?gad_source=1&gclid=CjwKCAiAx_GqBhBQEiwAlDNAZq3gPwu2uIyY4m9xR3tdIIanpMa13PQrDnQ4o20ybkHjSZSo4DuFMBoColYQAvD_BwE")!,
                         label:{
                        Label(
                            title: { Text("MarchOfDimes: Postpartum").bold()
                            },
                            icon: {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 22, weight: .bold, design: .default))
                            })
                    })
                    .frame(width: 250, height: 50, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                
                .toolbar {
                        ToolbarItem(placement: .principal) {
                          VStack {
                            Text("Gain Insight From Verified Websites")
                              .foregroundColor(.purple)
                          }
                        }
                      }.toolbarBackground(.visible, for: .navigationBar)
                    .toolbarBackground(.gray, for: .navigationBar)
                    .navigationBarTitleDisplayMode(.inline)
                
                
            }
        }
    }
}
struct HealthInsightsView_Previews: PreviewProvider {
    static var previews: some View {
        HealthInsightsView()
    }
}
