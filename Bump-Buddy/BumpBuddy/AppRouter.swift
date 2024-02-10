import Foundation

enum AppRouter: Hashable {
    case day(date: Date)
    case booking(date: Date)
    case confirmation(date: Date)
}
