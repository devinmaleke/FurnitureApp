//
//  ContentView.swift
//  FurnitureShopApp
//
//  Created by Devin Maleke on 06/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex: Int=0
    private let categories = ["All","Chair","Sofa","Lamp","Kitchen","Table"]
    var body: some View {
        ZStack{
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical) {
                VStack (alignment: .leading){
                    AppBarView()
                    TagLineView()
                        .padding()
                    SearchandScanView()
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(0 ..< categories.count) { i in
                                CategoryView(isActive: i==selectedIndex, text: categories[i])
                                    .onTapGesture {
                                        selectedIndex = i
                                    }
                            }
                        }.padding()
                    }
                    Text("Popular")
                        .font(.title)
                        .padding(.horizontal)
                        .bold()
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<4) { index in
                                ProductCardView(image: Image("chair_\(index+1)"), size: 210)
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                    
                    Text("Best")
                        .font(.title)
                        .padding(.horizontal)
                        .bold()
                        .padding(.top)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<4) { index in
                                ProductCardView(image: Image("chair_\(index+1)"), size: 180)
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
            
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack{
            Button(action: {}){
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Button(action:{}){
                Image("Profile")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.largeTitle)
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.largeTitle)
            .bold()
            .foregroundColor(Color("Primary"))
    }
}

struct SearchandScanView: View {
    @State private var search: String = ""
    var body: some View {
        HStack{
            HStack{
                Image("Search")
                    .padding(.trailing,8)
                TextField("Search Furniture", text: $search)
            }
            .padding(.all,20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button(action:{}){
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
            
            
        }.padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size:18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary"): Color.black.opacity(0.5))
            
            if(isActive){
                Color("Primary")
                    .frame(width:15, height:2)
                    .clipShape(Capsule())
            }
        }.padding(.trailing)
    }
}

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            
            Text("Luxury Swedian Chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing:2){
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                
                Spacer()
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }.frame(width: size)
            .padding()
            .background(Color.white)
            .cornerRadius(20.0)
    }
}
