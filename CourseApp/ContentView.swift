//
//  ContentView.swift
//  CourseApp
//
//  Created by badar on 18/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            CustomTabView()
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTabView : View {
    
    @State var selectedTab = "home"
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            // Using Tab View For Swipe Gesturess...
            // if you dont need swipe gesture tab change means just use switch case....to switch views....
            
            TabView(selection: $selectedTab) {
                
                Home()
                    .tag("home")
                
                Email()
                    .tag("email")
                
                Berkas()
                    .tag("berkas")
                
                Pengaturan()
                    .tag("pengaturan")
                    }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            // for bottom overflow...
            
            HStack(spacing: 0) {
                
                ForEach(tabs, id: \.self) { image in
                    
                    TabButton(image: image, selectedTab: $selectedTab)
                    
                    // equal spacing...
                    
                    if image != tabs.last {
                        
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 5)
            .background(Color.white)
            .shadow(color: .blue, radius: 5, x: 5, y: 5)
            .shadow(color: .blue, radius: 5, x: -5, y: -5)
            .clipShape(Capsule())
            .padding(.horizontal)
            // for smaller iphones...
            // elevations...
            .padding(.bottom, edge!.bottom == 0 ? 20 : 0)
            
            // ignoring tabview elevation...
            
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
    }
}

// tabs...
// Image Names...
var tabs = ["home", "email", "berkas", "pengaturan"]

struct TabButton : View {
    
    var image: String
    @Binding var selectedTab : String
    var body: some View{
        
        Button(action: {selectedTab = image}) {
            
            Image(image)
                .renderingMode(.template)
                .foregroundColor(selectedTab == image ? Color("tab") :
                    Color.black.opacity(0.4))
                .padding()
        }
    }
}

struct Home : View {
    
    @State var txt = ""
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets

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
                    
                    HStack {
                        
                        Text("Kategori")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {}) {
                            Text("Lihat Semua")
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.top, 25)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 20) {
                        
                        ForEach(courses) { course in
                            
                            NavigationLink(destination: DetailView(course: course)) {
                                
                                CourseCardView(course: course)
                            }
                            
                        }
                    }
                    .padding(.top)
                }
                .padding()
                .padding(.bottom, edge!.bottom + 70)
            }
        }
    }
}

struct CourseCardView : View {
    
    var course : Course
    
    var body: some View {
        
        VStack {
            
            VStack {
                
                Image(course.asset)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                    .background(Color(course.asset))
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(course.name)
                            .font(.title3)
                        
                        Text("\(course.numCourse) Courses")
                    }
                    .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(15)
            
            // or you can use max height in flexible in grid item...
            
            Spacer(minLength: 0)
        }
    }
}

// tabViews...

struct Email : View {
    
    var body: some View{
        
        VStack {
            
            Text("Email")
        }
    }
}

struct Berkas : View {
    
    var body: some View{
        
        VStack {
            
            Text("Berkas")
        }
    }
}

struct Pengaturan : View {
    
    var body: some View{
        
        VStack {
            
            Text("Pengaturan")
        }
    }
}

// Model Data...
struct Course : Identifiable {
    
    var id = UUID().uuidString
    var name : String
    var numCourse : Int
    var asset : String
}

// both image and color name is same so i used common word asset
var courses = [
    
    Course(name: "Coding", numCourse: 50, asset: "coding"),
    Course(name: "Trading", numCourse: 26, asset: "trading"),
    Course(name: "Cooking", numCourse: 30, asset: "cooking"),
    Course(name: "Marketing", numCourse: 40, asset: "marketing"),
    Course(name: "UI/UX", numCourse: 20, asset: "uiux"),
    Course(name: "Digital Marketing", numCourse: 20, asset: "digital")
]


struct DetailView : View {
    
    var course : Course
    
    var body: some View{
        
        VStack {
            
            Text(course.name)
                .font(.title2)
                .fontWeight(.bold)
        }
        .navigationTitle(course.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {}, label: {
            
            Image(systemName: "menu")
                .renderingMode(.template)
                .foregroundColor(.gray)
        }))
    }
}
