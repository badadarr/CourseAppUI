//
//  ContentView.swift
//  CourseApp
//
//  Created by badar on 18/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var txt = ""
    var body: some View {
        
        VStack {
            
            HStack {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Hello Badadarr")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Ayok Upgrade Skill Kamu!!")
                }
                .foregroundColor(.black)
                
                Spacer(minLength: 0)
                
                Button(action: {}) {
                    Image("profile")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 70)
                        .cornerRadius(10)
                        .shadow(color: .blue, radius: 5)
                }
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    HStack(spacing: 15) {
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Cari Kursus", text: $txt)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(Color.white)
                    .clipShape(Capsule())
                }
                .padding()
            }
        }
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
    }
}

// Model Data...
struct Course : Identifiable {
    
    var id = UUID().uuidString
    var name : String
    var numCourse : Int
    var asset : String
}

var courses = [
    
    Course(name: "Coding", numCourse: 12, asset: "coding"),
    Course(name: "Trading", numCourse: 12, asset: "trading"),
    Course(name: "Cooking", numCourse: 12, asset: "cooking"),
    Course(name: "Marketing", numCourse: 12, asset: "marketing"),
    Course(name: "UI/UX", numCourse: 12, asset: "uiux"),
    Course(name: "Digital Marketing", numCourse: 12, asset: "digital")
]
