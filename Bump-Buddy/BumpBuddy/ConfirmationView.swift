//
//  ConfirmationView.swift
//  Calendly
//
//  Created by Jason Dubon on 8/26/23.
//

import SwiftUI

struct ConfirmationView: View {
    @Binding var path: NavigationPath
    var currentDate: Date
        
    var body: some View {
        VStack {
            Image("doc")
                .resizable()
                .scaledToFill()
                .frame(width: 128, height: 128)
                .cornerRadius(64)
            
            Text("Confirmed")
                .font(.title)
                .bold()
                .padding()
            
            Text("You are scheduled with Dr May.")
            
            Divider()
                .padding()
            
            VStack(alignment: .leading, spacing: 32) {
                HStack {
                    Circle()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.blue)
                    
                    Text("BumpBuddy")
                }
                
                HStack {
                    Image(systemName: "video")
                    
                    Text("FaceTime")
                }
                
                HStack(alignment: .top) {
                    Image(systemName: "calendar")
                    
                    Text(currentDate.bookingViewDateFormat())
                }
            }
            
            Spacer()
            
            Button {
                path = NavigationPath()
            } label: {
                Text("Done")
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.blue)
                    )
            }

        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ConfirmationView(path: .constant(NavigationPath()), currentDate: Date())
        }
    }
}
