//
//  ContentView.swift
//  DynamicListApp
//
//  Created by ioannis giannakidis on 25/7/19.
//  Copyright © 2019 ioannis giannakidis. All rights reserved.
//
import Combine
import SwiftUI
class DataSouce: BindableObject {
    let willChange = PassthroughSubject<Void, Never>() // change is here
    var pictures = [String]()
    init() {
        let fm = FileManager.default
        guard let path = Bundle.main.resourcePath else { return }
        guard let items = try? fm.contentsOfDirectory(atPath: path) else { return }
        for item in items where item.hasPrefix("nssl") {
            pictures.append(item)
        }
        willChange.send(()) // and here
    }
}
struct ContentView: View {
    var body: some View {
        NavigationView{
        List {
            Text("hello World")
            Text("hello World")
            Text("hello World")
            Text("hello World")
            Text("hello World")
            Text("hello World")

            }.navigationBarTitle(Text("Storm Viewer"))
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
