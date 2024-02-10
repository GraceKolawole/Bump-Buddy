//
//  DatabaseManager.swift
//  Calendly
//
//  Created by Jason Dubon on 8/26/23.
//

import Foundation
import Supabase

struct Hours: Codable {
    let id: Int
    let createdAt: Date
    let day: Int
    let start: Int
    let end: Int
    
    enum CodingKeys: String, CodingKey {
        case id, day, start, end
        case createdAt = "created_at"
    }
}

struct Appointment: Codable {
    var id: Int?
    let createdAt: Date
    let name: String
    let email: String
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case id, name, email, date
        case createdAt = "created_at"
    }
}

class DatabaseManager: ObservableObject {

    @Published var avaliableDates = [Date]()
    @Published var days: Set<String> = []
    
    private let client = SupabaseClient(supabaseURL: URL(string: "https://ysxxzoohzpnvjvgyjsmc.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlzeHh6b29oenBudmp2Z3lqc21jIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA1ODE5NzQsImV4cCI6MjAxNjE1Nzk3NH0.wGJ6wnlNgpR4N2Ue9urt0JoL4HAIQ8Sz7pkaCKYAXG8")
    
    init() {
        Task {
            do {
                let dates = try await self.fetchAvaliableAppointments()
                await MainActor.run {
                    avaliableDates = dates
                    days = Set(avaliableDates.map({ $0.monthDayYearFormat() }))
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetchHours() async throws -> [Hours] {
        let response: [Hours] = try await client.database.from("hours").select().execute().value
        return response
    }
    
    private func fetchAvaliableAppointments() async throws -> [Date] {
        let appts: [Appointment] = try await client.database.from("appointments").select().execute().value
        return try await generateAppointmentTimes(from: appts)
    }
    
    private func generateAppointmentTimes(from appts: [Appointment]) async throws -> [Date] {
        let takenAppts: Set<Date> = Set(appts.map({ $0.date }))
        let hours = try await fetchHours()
        let calendar = Calendar.current
        let currentWeekday = calendar.component(.weekday, from: Date()) - 2
        
        var timeSlots = [Date]()
        
        for weekOffset in 0...2 {
            let daysOffset = weekOffset * 7
            
            for hour in hours {
                if hour.start != 0 && hour.end != 0 {
                    var currentDate = calendar.date(from: DateComponents(year: calendar.component(.year, from: Date()), month: calendar.component(.month, from: Date()), day: calendar.component(.day, from: Date()) + daysOffset + (hour.day - currentWeekday), hour: hour.start))!
                    
                    while let nextDate = calendar.date(byAdding: .minute, value: 30, to: currentDate), calendar.component(.hour, from: nextDate) <= hour.end {
                        
                        if !takenAppts.contains(currentDate) && currentDate > Date() && calendar.component(.hour, from: currentDate) != hour.end {
                            timeSlots.append(currentDate)
                        }
                        currentDate = nextDate
                    }
                }
            }
        }
        
        return timeSlots
    }
    
    func bookAppointment(name: String, email: String, notes: String, date: Date) async throws {
        let appointment = Appointment(createdAt: Date(), name: name, email: email, date: date)
    let _ = try await client.database.from("appointments").insert(appointment).execute()
    }
}
