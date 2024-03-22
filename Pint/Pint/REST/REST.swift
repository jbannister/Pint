//
//  REST.swift
//  Pint
//
//  Created by Jan Bannister on 18/03/2024.
//

import Foundation


func rest_test() {
    
    let url = URL(string: "https://datastore.googleapis.com/v1/projects/pint-417815:commit")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("Bearer YOUR_ACCESS_TOKEN", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    let body: [String: Any] = [
        "mode": "NON_TRANSACTIONAL",
        "mutations": [
            [
                "insert": [
                    "key": [
                        "path": [
                            [
                                "kind": "Person"
                            ]
                        ]
                    ],
                    "properties": [
                        "Name": ["stringValue": "John Doe"],
                        "Address": ["stringValue": "123 Main St"],
                        "Lat": ["doubleValue": 37.4220],
                        "Long": ["doubleValue": -122.0840]
                    ]
                ]
            ]
        ]
    ]

    do {
        let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
        request.httpBody = jsonData
    } catch {
        print("Error serializing JSON: \(error)")
        return
    }

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print("Error: \(error?.localizedDescription ?? "Unknown error")")
            return
        }
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            print("HTTP Error: \(httpResponse.statusCode)")
            return
        }

        do {
            if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print(jsonResponse)
            }
        } catch {
            print("Error parsing JSON: \(error)")
        }
    }

    task.resume()
    
}
