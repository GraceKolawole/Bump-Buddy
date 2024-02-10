//
// 
//  Calendly
//
//  Created by Jason Dubon on 6/30/23.
//

import SwiftUI

struct AppointmentSchedulerView: View {
    @StateObject var manager = DatabaseManager()
    
    let days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    @State private var selectedMonth = 0
    @State private var selectedDate = Date()
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Image("doc")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 128, height: 128)
                    .cornerRadius(64)
                
                
                Text("BumpBody")
                    .font(.title)
                    .bold()
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                
                VStack(spacing: 20) {
                    Text("Select a Day To Talk to a doctor")
                        .font(.title2)
                        .bold()
                    
                    // Month Selection
                    HStack {
                        Spacer()
                        
                        Button {
                            withAnimation {
                                selectedMonth -= 1
                            }
                        } label: {
                            Image(systemName: "lessthan.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.gray)
                        }

                        
                        Spacer()
                        
                        Text(selectedDate.monthYearFormat())
                            .font(.title2)
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                selectedMonth += 1
                            }
                        } label: {
                            Image(systemName: "greaterthan.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.gray)
                        }

                        Spacer()
                    }
                    
                    HStack {
                        ForEach(days, id:\.self) { day in
                            Text(day)
                                .font(.system(size: 12, weight: .medium))
                                .frame(maxWidth: .infinity)
                        }
                    }
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 20) {
                        ForEach(fetchDates()) { value in
                            ZStack {
                                if value.day != -1 {
                                    let hasAppts = manager.days.contains(value.date.monthDayYearFormat())
                                    
                                    NavigationLink(value: AppRouter.day(date: value.date)) {
                                        Text("\(value.day)")
                                            .foregroundColor(hasAppts ? .blue : .black)
                                            .fontWeight(hasAppts ? .bold : .none)
                                            .background {
                                                ZStack(alignment: .bottom) {
                                                    Circle()
                                                        .frame(width: 48, height: 48)
                                                        .foregroundColor(hasAppts ? .blue.opacity(0.1) : .clear)
                                                    
                                                    if value.date.monthDayYearFormat() == Date().monthDayYearFormat() {
                                                        Circle()
                                                            .frame(width: 8, height: 8)
                                                            .foregroundColor(hasAppts ? .blue : .gray)
                                                    }
                                                }
                                            }
                                    }
                                    .disabled(!hasAppts)
                                } else {
                                    Text("")
                                }
                            }
                            .frame(width: 32, height: 32)
                        }
                    }
                    
                }
                .padding()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .onChange(of: selectedMonth) { _ in
                selectedDate = fetchSelectedMonth()
            }
            .navigationDestination(for: AppRouter.self) { router in
                switch router {
                case .day(let date):
                    DayView(path: $path, currentDate: date)
                        .environmentObject(manager)
                    
                case .booking(let date):
                    BookingView(path: $path, currentDate: date)
                        .environmentObject(manager)
                    
                case .confirmation (let date):
                    ConfirmationView(path: $path, currentDate: date)
                }
            }
        }
    }
    
    func fetchDates() -> [CalendarDate] {
        let calendar = Calendar.current
        let currentMonth = fetchSelectedMonth()
        
        var dates = currentMonth.datesOfMonth().map({ CalendarDate(day: calendar.component(.day, from: $0), date: $0) })
        
        let firstDayOfWeek = calendar.component(.weekday, from: dates.first?.date ?? Date())
        
        for _ in 0..<firstDayOfWeek - 1 {
            dates.insert(CalendarDate(day: -1, date: Date()), at: 0)
        }
        
        return dates
    }
    
    func fetchSelectedMonth() -> Date {
        let calendar = Calendar.current
        
        let month = calendar.date(byAdding: .month, value: selectedMonth, to: Date())
        return month!
    }
}

struct CalendarDate: Identifiable {
    let id = UUID()
    var day: Int
    var date: Date
}

struct AppointmentSchedulerView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentSchedulerView()
    }
}
