import Foundation

class FormatHelper {
    class func date(from string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter.date(from: string)
    }
    
    class func stringDate(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        
        return formatter.string(from: date)
    }
    
    class func string(from number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .decimal
        
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
    
    class func string(from number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 0
        formatter.numberStyle = .decimal
        
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
}
