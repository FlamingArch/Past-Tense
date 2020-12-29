//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 05/12/20.
//

import SwiftUI

struct PageView: View {
    var pageHeadline: String
    var pageBody: String
    var pageImage: Image
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                VStack(alignment: .leading) {
                    Text("Friday, November 21, 2020")
                        .font(.headline)
                    Text("\(pageBody.count) Characters\n")
                        .font(.headline)
                }
                .padding()
                ZStack(alignment: .topLeading){
                    VStack(alignment: .leading) {
                        pageImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .font(.title)
                        //                                .frame(height: 256)
                        Text("Dear Diary\n\t" + pageBody)
                            .padding()
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 16.0))
                }
                .background(
                    RoundedRectangle(cornerRadius: 16.0)
                        .foregroundColor(.white)
                        .shadow(radius: 20)
                )
                .padding(EdgeInsets(top: 80, leading: 16, bottom: 16, trailing: 16))
            }
            //                .padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
        }
        .navigationBarTitle(pageHeadline)
        .navigationBarItems(
            trailing: HStack {
                Menu(content: {
                    Button(action: {}, label: {
                        HStack {
                            Image(systemName: "pencil")
                                .font(.title2)
                            Text("Edit")
                        }
                    })
                    Button(action: {}, label: {
                        HStack {
                            Image(systemName: "tag")
                                .font(.title2)
                            Text("Edit Tags")
                        }
                    })
                    Button(action: {}, label: {
                        HStack {
                            Image(systemName: "eye")
                                .font(.title2)
                            Text("Don't Show")
                        }
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack {
                            Image(systemName: "trash")
                                .font(.title2)
                            Text("Delete")
                        }
                    })
                },
                label: {
                    Image(systemName: "ellipsis.circle")
                        .font(.title2)
                })
                .padding()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title2)
                })
            }
        )
    }
    
}




//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PageView(page: journals[0].pages[0], pageNo: 3).previewDevice("iPhone 12")
//    }
//}
