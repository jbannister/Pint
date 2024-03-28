//
//  FirestoreService.swift
//  Pint
//
//  Created by Jan Bannister on 28/03/2024.
//

import SwiftUI


func resetREST()  {
    guard let url = URL(string: "https://datastore.googleapis.com/v1/projects/Pint:runQuery") else { return }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
    
    let queryPayload: [String: Any] = [:
        // Your query parameters here
    ]
    let data = try? JSONSerialization.data(withJSONObject: queryPayload)
    request.httpBody = data
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data else { return }
        
        // Parse the JSON response
        do {
            let decodedResponse = try JSONDecoder().decode([PersonREST].self, from: data)
            DispatchQueue.main.async {
                // Update your UI based on the response
            }
        } catch {
            // Handle error
        }
    }.resume()
    
}

struct PersonREST: Codable {
    var id = ""
    var address = ""
    var latitude:Float
    var longitude:Float
    var name:String
}

