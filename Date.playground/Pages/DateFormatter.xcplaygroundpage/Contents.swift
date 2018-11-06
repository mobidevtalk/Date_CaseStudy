import Foundation

let date = Date(timeIntervalSinceReferenceDate: 60*60*60*24*30*3.5)

//let icelandFormatter = DateFormatter()
//icelandFormatter.locale = Locale(identifier: "IS") // IS stands for Iceland
//icelandFormatter.dateStyle = .short
//
//let stringDate = icelandFormatter.string(from: date)
//let formattedDate = icelandFormatter.date(from: "5.11.2018")


let panamaFormatter = DateFormatter()
panamaFormatter.locale = Locale(identifier: "DE") // IS stands for Iceland
panamaFormatter.dateStyle = .short

let stringDate = panamaFormatter.string(from: date)
let formattedDate = panamaFormatter.date(from: "5/11/2018")


let formatter = DateFormatter()
formatter.locale = Locale(identifier: "BD")
formatter.dateFormat = "EEEE, MMM d, yyyy"
formatter.string(from: date)
formatter.date(from: "5.11.2018")

formatter.dateFormat = "d.M.yyyy"
formatter.string(from: date)
formatter.date(from: "5.11.2018")






