struct DomainModel {
    var text = "Hello, World!"
        // Leave this here; this value is also tested in the tests,
        // and serves to make sure that everything is working correctly
        // in the testing harness and framework.
}

////////////////////////////////////
// Money
//
public struct Money {
    var amount: Int;
    var currency: String;
    
    init(amount: Int, currency: String) {
        self.amount = amount;
        self.currency = currency;
    }
    
    // convert
    // we either want to swtich the curreny to USD or USD to the given currency
    func convert(_ c: String) -> Money {
        var usd: Int;
        var final: Int;
        switch self.currency {
            // GBP
            case "GBP":
                usd = self.amount * 2
            // EUR
            case "EUR":
                usd = self.amount * 2 / 3
            // CAN
            case "CAN":
                usd = self.amount * 4 / 5
            default:
                usd = self.amount * 1
        };
        
        switch c {
            // GBP
            case "GBP":
                final = usd / 2
            // EUR
            case "EUR":
                final = usd * 3 / 2
            // CAN
            case "CAN":
                final = usd * 5 / 4
            default:
                final = usd * 1
        };
        
        return Money(amount: final, currency: c);
    }
    
    // add
    func add(_ other: Money) -> Money {
        let converted = self.convert(other.currency)
        return Money(amount: converted.amount + other.amount, currency: other.currency);
    }
    
//     subtract
    func subtract(_ other: Money) -> Money {
        return Money(amount: self.amount - other.amount, currency: other.currency);
    }
    
}

////////////////////////////////////
// Job
//
public class Job {
    var title: String;
    var type: JobType;
    
    init(title: String, type: JobType) {
        self.title = title;
        self.type = type;
    }
    
    public enum JobType {
        case Hourly(Double)
        case Salary(UInt)
    }
    
    // calculateIncome
    func calculateIncome(_ hours: Int = 2000) -> Int {
        switch self.type {
        // salary
        case .Salary(let annualSalary):
            return Int(annualSalary);
            
        // hourly
        case .Hourly(let hourlyRate):
            return Int(Double(hours) * hourlyRate);
        };
    }
    
    // raise
    // no _ b/c ineternal parameter
    // byAmount
    func raise(byAmount: Double) {
        switch self.type {
        // salary
        case .Salary(let annualSalary):
            self.type = .Salary(annualSalary + UInt(Int(byAmount)))
            
        // hourly
        case .Hourly(let hourlyRate):
            self.type = .Hourly(hourlyRate + byAmount)
        };
    }
    
    // byPercent
    func raise(byPercent: Double) {
        switch self.type {
        // salary
        case .Salary(let annualSalary):
            self.type = .Salary(UInt(Double(annualSalary) * (1.0 + byPercent)))
            
        // hourly
        case .Hourly(let hourlyRate):
            self.type = .Hourly(hourlyRate + (1.0 + byPercent))
        };
    }
}

////////////////////////////////////
// Person
//
public class Person {
}

////////////////////////////////////
// Family
//
public class Family {
}
