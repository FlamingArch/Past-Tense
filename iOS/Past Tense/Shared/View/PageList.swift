//
//  Sample.swift
//  Past Tense
//
//  Created by Harsh Chaturvedi on 06/12/20.
//

import SwiftUI

struct PagesList: View {
    @State var showingNewItemSheet : Bool = false
    @State var pages : [PageModel]
    @State private var newHeadline: String = ""
    @State private var newBody : String = ""
    @State private var newDate : Date = Date()
    @State private var newImage : Image =  Image(systemName: "doc.circle.fill")
//    @State private var selectedView: Int? = 0
    @Environment(\.presentationMode) var presentationMode
    func addItem() {
        pages.append(PageModel(headline: newHeadline, body: newBody, image:newImage, date: newDate))
        deleteDraft()
    }
    
    func deleteDraft() {
        newHeadline = ""
        newBody = ""
        newDate = Date()
    }
    func delete(at offsets: IndexSet) {
        pages.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView{
            List {
                Section(header: Text("Recommended")) {
                    let range = 0..<pages.count
                    if !range.isEmpty {
                        let page = pages[Int.random(in: range)]
                        NavigationLink(destination: PageView(pageHeadline: page.headline, pageBody: page.body, pageImage: page.image)){
                            Page(page: page)
                        }
                    }
                }
                Section(header: Text("All Pages")) {
                    ForEach(pages) { page in
                        NavigationLink(destination: PageView(pageHeadline: page.headline, pageBody: page.body, pageImage: page.image)){
                            Page(page: page)
                        }
                    }
                    .onDelete(perform: delete)
                }
            }
//            .listStyle(SidebarListStyle())
            .listStyle(InsetGroupedListStyle())
            .listRowBackground(RoundedRectangle(cornerRadius: 25.0)
                                .foregroundColor(.red))
            .navigationBarTitle("Past Tense")
            .navigationBarItems(
                trailing:
                    HStack {
                        Button(action: {
                            self.showingNewItemSheet.toggle()
                        }, label: {Image(systemName: "plus").font(.title2)}
                        )
                        .sheet(isPresented: $showingNewItemSheet) {
                            NewPageView(headline: $newHeadline, bodyText: $newBody, date: $newDate, image: $newImage, onDonePress: {addItem()},onDeletePress:{deleteDraft()} )
                            
                        }
                    }
            )
            //            .navigationBarItems(trailing: {
            //                Menu(content: {
            //                    Button(action: {}, label: {
            //                        HStack{
            //                            Image(systemName: "info.circle")
            //                            Text("About")
            //                        }
            //                    })
            //                }, label: {
            //                    Image(systemName: "ellipsis.circle")
            //                        .font(.title2)
            //                })
            //            })
            .toolbar{
                ToolbarItem(placement: .bottomBar) {
                    Text("")
                }
                ToolbarItem(placement: .status) {
                    Text("\(pages.count) Pages")
                }
                ToolbarItem(placement: .bottomBar) {
                    Menu(content: {
                        Button(action: {}, label: {
                            HStack{
                                Image(systemName: "info.circle")
                                Text("About")
                            }
                        })
                    }, label: {
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                    })
                }
            }
        }
//        .onAppear{
//            let device = UIDevice.current
//            if device.model == "iPad"
//            //                && device.orientation.isLandscape
//            {
//                self.selectedView = 1
//            } else {
//                self.selectedView = 1
//            }
//        }
//        .touchBar {
//            Button(action: {
//                self.showingNewItemSheet.toggle()
//            }, label: {Image(systemName: "plus").font(.title2)}
//            )
//            .sheet(isPresented: $showingNewItemSheet) {
//                NewPageView(headline: $newHeadline, bodyText: $newBody, date: $newDate, image: $newImage, onDonePress: {addItem()},onDeletePress:{deleteDraft()} )
//
//            }
//        }
    }
}

struct Page: View {
    var page: PageModel
    
    var body: some View {
        HStack{
            page.image
                .resizable()
                .frame(width: 48, height: 48, alignment: .center)
                //                .aspectRatio(contentMode: .)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(page.headline)
                Text(page.date.description)
                    .font(.subheadline)
            }
        }
    }
}

