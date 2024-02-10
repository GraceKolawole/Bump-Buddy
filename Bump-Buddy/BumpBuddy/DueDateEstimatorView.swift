//
//  DueDateEstimatorView.swift
//  BumpBuddy
//
//  Created by Bolanle Adisa on 11/17/23.
//

import SwiftUI

struct DueDateEstimatorView: View {
    @State private var lmpDate: Date = Date()
    @State private var conceptionDate: Date = Date()
    @State private var menstrualCycleLength: Int = 28
    @State private var estimatedDueDate: Date?
    @State private var isLMPSelected: Bool = true

    var body: some View {
        VStack {

            // Icon at the top of the screen
            Image(systemName: "calendar.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding(.top, 20)

            Text("Estimate Your Due Date")
                .font(.title)
                .fontWeight(.bold)

            Text("Want to know the big day? Find out now using the first day of your last menstrual period or the conception date.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.top, 5)

            Picker("Calculation Method", selection: $isLMPSelected) {
                Text("LMP").tag(true)
                Text("Conception Date").tag(false)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)

            Group {
                if isLMPSelected {
                    DatePicker("Last Menstrual Period", selection: $lmpDate, displayedComponents: .date)
                    Stepper("Cycle Length: \(menstrualCycleLength) days", value: $menstrualCycleLength, in: 21...35)
                } else {
                    DatePicker("Conception Date", selection: $conceptionDate, displayedComponents: .date)
                }
            }
            .padding(.horizontal)

            Button("Calculate Due Date", action: calculateDueDate)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.horizontal)

            if let dueDate = estimatedDueDate {
                Text("Your Estimated Due Date Is:")
                    .font(.headline)
                Text("\(dueDate, formatter: dateFormatter)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
            }

            Spacer() // To keep everything centered
        }
    }

    private func calculateDueDate() {
        // Calculation logic as before
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

struct DueDateEstimatorView_Previews: PreviewProvider {
    static var previews: some View {
        DueDateEstimatorView()
    }
}
