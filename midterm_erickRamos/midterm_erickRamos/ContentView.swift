//
//  ContentView.swift
//  Midterm Project
//  Author: Erick Ramos
//  Date: 10/20/26
//

import SwiftUI
import Combine // Required for ObservableObject protocol conformance

// MVVM Architecture that manages the app's state and data logic.
// Observable and Published tell Swift that ArtistsViewModel holds data the view needs to watch.
class ArtistsViewModel: ObservableObject {
    // @Published broadcasts data changes to the view
    @Published var artists: [Subject] = Bundle.main.decode([Subject].self, from: "Data.json")
}

// Main Content View
struct ContentView: View {
    // Instantiate our ViewModel following the MVVM concept
    @StateObject private var viewModel = ArtistsViewModel()

    var body: some View {
        NavigationView {
            List {
                // ForEach loop iterating through items decoded from JSON
                ForEach(viewModel.artists) { artist in
                    NavigationLink(destination: DetailView(artist: artist)) {
                        HStack(spacing: 16) {
                            // Container view and thumbnail image display
                            Image(artist.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 65, height: 65)
                                .clipShape(Circle())
                                .shadow(radius: 3)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text(artist.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text("Tap to view details")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Erick's Top Artists")
        }
    }
}

// Detail View is the Navigation Destination
struct DetailView: View {
    // The artist variable receives the exact artist object clicked on the homescreen
    let artist: Subject

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Larger feature image display for the detail page
                Image(artist.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .shadow(radius: 8)
                    .padding(.top)

                VStack(alignment: .leading, spacing: 15) {
                    // Item Name
                    Text(artist.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Divider()

                    // Item Description section
                    Text("About the Artist")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    Text(artist.description)
                        .font(.body)
                        .lineSpacing(6)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .navigationTitle(artist.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
