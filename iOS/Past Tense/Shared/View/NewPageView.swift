//
//  NewPageView.swift
//  Past Tense
//
//  Created by Harsh Chaturvedi on 06/12/20.
//

import SwiftUI

struct NewPageView: View {
    @Binding var headline: String
    @Binding var bodyText: String
    @Binding var date: Date
    @State private var showingImagePicker : Bool = false
    @Binding var image: Image
    var onDonePress : ()->Void
    var onDeletePress : ()->Void
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Details")) {
                    Button(action:{
                        
                    }, label: {
                        HStack{
                            Text("Featured Image")
                                .padding()
                            Spacer()
                            image
                                .resizable()
                                .frame(width: 100,height: 100, alignment: .center)
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(.gray)
                                .padding()
                        }
                    })
                    .frame(alignment: .center)
                    TextField("Headline", text: $headline)
                    DatePicker("Date", selection: $date)
                    
                    
                }
                Section(header: Text("Body")) {
                    TextEditor(text: $bodyText)
                }
            }
            .navigationBarTitle("New Page")
            .navigationBarItems(
                leading: HStack {
                    Button(
                        action: {self.presentationMode.wrappedValue.dismiss()}, label: {
                            Image(systemName: "xmark")
                                .font(.title2)
                        }
                    )
                    Button(
                        action: {self.onDeletePress();self.presentationMode.wrappedValue.dismiss()}, label: {
                            Image(systemName: "trash")
                                .font(.title2)
                        }
                    )
                    .padding()
                },
                trailing: Button("Done"){
                    self.onDonePress()
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}

//struct NewPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPageView(headline: pages[0].$headline)
//    }
//}
