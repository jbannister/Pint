//
//  MapView.swift
//  Pint
//
//  Created by Jan Bannister on 17/03/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var cameraPosition: MapCameraPosition = .region(MKCoordinateRegion())
    @State private var searchText = ""
    @State private var results = [MKMapItem]()
    
    @State private var mapSelection: MKMapItem?
    @State private var showDetails = false
    @State private var getDirections = false
    
    // Direction
    @State private var routeDisplaying = false
    @State private var route: MKRoute?
    @State private var routeDestination: MKMapView?
    
    var persons = [
        Person(name: "Jan",
               address: "49 King George, Richmond",
               coordinate:
                CLLocationCoordinate2D(latitude: 51.453630,
                                       longitude: -0.290940)),
        Person(name: "MC",
               address: "Church Road, Richmond",
               coordinate: CLLocationCoordinate2D(latitude: 51.460864,
                                                  longitude: -0.297149)),
        
        Person(name: "Shane Donnelly",
               address: "New Road, Reading",
               coordinate: CLLocationCoordinate2D(latitude: 51.443950,
                                                  longitude: -0.952680)),
        
        Person(name: "Colin O'Sullivan",
               address: "West Norwood, London",
               coordinate: CLLocationCoordinate2D(latitude: 51.43462818592707,
                                                  longitude: -0.10384535281600316)),
        
        Person(name: "Tall Connaughton",
               address: "Folgate Street, London",
               coordinate: CLLocationCoordinate2D(latitude: 51.52080696041292,
                                                  longitude: -0.07618033285277254))
        
        
    ]
    
    var body: some View {
                    
        Map(position: $cameraPosition, selection: $mapSelection) {
            ForEach(persons) { person in
                Marker(person.name, coordinate: person.coordinate)
            }
            
            ForEach(results, id: \.self) { result in
                Marker(result.placemark.name ?? "Anon", coordinate: result.placemark.coordinate)
                    .tint(.blue)
            }
            
            if let route {
                MapPolyline(route.polyline)
                    .stroke(.blue, lineWidth: 7)
            }
        }
        .overlay(alignment: .top) {
            TextField("Search for a location...", text: $searchText)
                .font(.subheadline)
                .padding(12)
                .background(.white)
                .padding()
                .shadow(radius:10)
        }
        .onSubmit(of: .text) {
            // on return? 
            Task { await searchPlaces() }
        }
        .onChange(of: getDirections, { oldValue, newValue in
            if newValue {
                fetchRoute()
            }
        })
        .onChange(of: mapSelection, { oldValue, newValue in
            showDetails = newValue != nil
        })
        .sheet(isPresented: $showDetails) {
            LocationDetailView(mapSelection:    $mapSelection,
                               show:            $showDetails,
                               getDirections:   $getDirections)
                .presentationDetents([.height(340)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(340)))
                .presentationCornerRadius(12)
        }
        .mapControls{
            MapCompass()
            MapPitchToggle()
            MapUserLocationButton()
        }
        .task {
            fetchRoute()
        }

    }
    
    func searchPlaces() async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = persons[0].region

        let results = try? await MKLocalSearch(request: request).start()
        self.results = results?.mapItems ?? []
    }
    
    func fetchRoute() {
        
        let request = MKDirections.Request()
        request.source = persons[0].mapItem
        
        if let mapSelection {
            request.destination = mapSelection
        } else {
            request.destination = persons[1].mapItem
        }
        request.transportType = .automobile
        
        Task {
            let result = try? await MKDirections(request: request).calculate()
            route = result?.routes.first
            //routeDestination = mapSelection
            
            withAnimation(.easeInOut) {
                if let rect = route?.polyline.boundingMapRect {
                    cameraPosition = .rect(rect)
                }
            }
        }
    }
    
    
}

#Preview {
    MapView()
}


