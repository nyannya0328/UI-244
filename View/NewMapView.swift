//
//  NewMapView.swift
//  UI-244
//
//  Created by nyannyan0328 on 2021/06/24.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI

struct NewMapView: View {
    @StateObject var model = MapViewModel()
    var body: some View {
        ZStack(alignment:.bottomTrailing){
            
            
          
            
            
            Map(coordinateRegion: $model.region,showsUserLocation: true,annotationItems: model.coffeeShops) { shop in
                
                MapMarker(coordinate: shop.item.placemark.coordinate, tint: .green)
                
                
            }
            .ignoresSafeArea()
           
            
            LocationButton(.currentLocation){
                
                model.manager.requestLocation()
                
                
            }
            .frame(width: 200, height: 50)
            .symbolVariant(.fill)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            
        
        }
        .overlay(
        Text("Coffee Shops")
            .font(.title.bold())
            .frame(maxWidth: .infinity,alignment: .leading)
            .foregroundColor(.white)
            .foregroundStyle(.green)
            .padding()
        
        ,alignment: .top
        
        )
    }
}

struct NewMapView_Previews: PreviewProvider {
    static var previews: some View {
        NewMapView()
    }
}
class MapViewModel : NSObject,ObservableObject, CLLocationManagerDelegate{
    
    
    @Published var manager = CLLocationManager()
    @Published var region : MKCoordinateRegion = .init()
    
    @Published var coffeeShops : [shop] = []
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last?.coordinate else {return}
        
        region = MKCoordinateRegion(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        async{
            
           await fetchCoffeeShops()

        }
        
        
        
                
                
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func fetchCoffeeShops()async{
        
        do{
            
            let request = MKLocalSearch.Request()
            request.region = region
            request.naturalLanguageQuery = "STAR"
            
            let query = MKLocalSearch(request: request)
            
            let reponce = try await query.start()
            
            
            await MainActor.run{
                self .coffeeShops = reponce.mapItems.compactMap({ item in
                    
                    return shop(item: item)
                    
                })
            }
            
            
            
        }
        
        catch{
            
            
            
        }
        
        
    }
    
    
}

struct shop : Identifiable{
    
    var id = UUID().uuidString
    var item : MKMapItem
}
