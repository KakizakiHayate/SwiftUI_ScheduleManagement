//
//  RevisionSheet.swift
//  ScheduleManagement
//
//  Created by 柿崎逸 on 2023/02/17.
//

import SwiftUI



struct RevisionSheet: View {
    @Binding var subjectArray: [String]
    @Binding var showRevisionSheet: Bool
    @Binding var date: Date
    
    var dateFormatter: DateFormatter {
        let dateFomat = DateFormatter()
        dateFomat.dateStyle = .none
        dateFomat.timeStyle = .short
        dateFomat.locale = Locale(identifier: "ja_JP")
        return dateFomat
    }
    
    
    var body: some View {
        
        ScrollView {
            VStack {
                Text("修正画面").font(.title2).bold().padding()
                ForEach(0 ..< subjectArray.count, id: \.self) { item in
                    HStack {
                        Text("\(item + 1)限目")
                            .font(.system(size: 15))
                            .foregroundColor(Color.customColorPurple)
                            .bold()
                            .padding(.bottom)
                            .padding(.leading)
                        
                        
                        TextField("未入力", text: $subjectArray[item])
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom)
                            .padding(.trailing)
                    }
                }
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        subjectArray.removeLast()
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(Color.customColorPurple)
                            .bold()

                    }.padding(.trailing).padding(.bottom)
                    
                    Button(action: {
//                        if subjectArray.count == 8 {
//
//                        }
                        subjectArray.append("")
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(Color.customColorPurple)
                            .bold()
                    }.padding(.trailing).padding(.bottom)
                }
                
                Spacer()
                
                DatePicker("電車の時間", selection: $date, displayedComponents: .hourAndMinute)
                    .padding()
                
                Button(action: {
                    showRevisionSheet = false
                }) {
                    Text("変更完了")
                        .padding()
                        .background(Color.customColorPurple)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                
            }
        }
        
    }
}

struct RevisionSheet_Previews: PreviewProvider {
    static var previews: some View {
        RevisionSheet(subjectArray: .constant(["","","","","",""]), showRevisionSheet: .constant(false), date: .constant(Date()))
    }
}
