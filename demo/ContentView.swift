import SwiftUI
import MapKit

@available(iOS 15.0, *)
struct ContentView: View {
    @State private var name = "Zohaib Khan"
    @State private var isAlert: Bool = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image("mypic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.cyan, lineWidth: 5))
                    .shadow(color: .gray, radius: 10, x: 0, y: 5)
                    .padding(.top, 20)

                VStack(spacing: 15) {
                    infoCard(title: "My Name:", value: "Zohaib Khan", color: .blue)
                    infoCard(title: "My Age:", value: "14", color: .green)
                    infoCard(title: "My Work:", value: "Android and iOS Developer", color: .purple)
                }
                .padding()

              
                Button(action: {
                    isAlert = true
                }) {
                    Text("Show My Location")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [.blue, .cyan]), startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
            }
            .padding()
        }
        .sheet(isPresented: $isAlert) {
            SecondScreen()
        }
    }

    
    private func infoCard(title: String, value: String, color: Color) -> some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            Spacer()
            Text(value)
                .font(.headline)
                .foregroundColor(color)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
        .padding(.horizontal, 10)
    }
}

@available(iOS 13.0, *)
struct SecondScreen: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )

    var body: some View {
        NavigationView {
            VStack {
                Text("My Location")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)

                Map(coordinateRegion: $region, showsUserLocation: true)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .cornerRadius(20)
                    .padding()

                Spacer()
            }
            .navigationTitle("Location")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
