//
//  REST.swift
//  Pint
//
//  Created by Jan Bannister on 18/03/2024.
//

import Foundation


func rest_test() {
    
    let url = URL(string: "https://datastore.googleapis.com/v1/projects/YOUR_PROJECT_ID:runQuery")!
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    request.addValue("Bearer YOUR_ACCESS_TOKEN", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let query = [
        "query": [
            "kind": [
                ["name": "YOUR_KIND"]
            ]
        ]
    ]
    
    let requestBody = try! JSONSerialization.data(withJSONObject: query, options: [])
    request.httpBody = requestBody
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print("Error: \(error?.localizedDescription ?? "Unknown error")")
            return
        }
        
        // Handle the response
        // If using Codable, decode the data to your model
        // Otherwise, use JSONSerialization to parse the JSON
    }
    
    task.resume()
    
}
