//
//  GithubAPI.swift
//  KPI Example
//
//  Created by Aleksey Filobok on 05.11.2021.
//

import Foundation

// Not good exapmle of API implementation. Just for example purposes

struct GithubSearchResult<T: Codable>: Codable {
    let items: [T]
}

struct Repository: Codable, Equatable {
    let id: Int
    let name: String
    let description: String?
    let stargazers_count: Int
}

enum GithubAPI {
    static let pageSize = 100
    
    static func searchRepos(query: String,
                            page: Int = 1,
                            completion: @escaping(([Repository]) -> Void)) {
        let url = URL(string: "https://api.github.com/search/repositories?q=\(query)&sort=stars&per_page=\(Self.pageSize)&page=\(page)")!
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion([])
                }
                return
            }
            do {
                let items = try JSONDecoder().decode(GithubSearchResult<Repository>.self, from: data).items
                DispatchQueue.main.async {
                    completion(items)
                }
            } catch {
                DispatchQueue.main.async {
                    completion([])
                }
            }
        }
        dataTask.resume()
    }
}
