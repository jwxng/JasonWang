import UIKit
import PlaygroundSupport

// Part One: HTTP, URLs, and URL Session

PlaygroundPage.current.needsIndefiniteExecution = true

struct StoreItem {
    var title: String
    var artist: String
    var kind: String
    var url: URL
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case artist
        case kind
        case url
        case description
    }
    
    enum AdditionalKeys: String, CodingKey {
        case longDescription
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: CodingKeys.title)
        artist = try values.decode(String.self, forKey: CodingKeys.artist)
        kind = try values.decode(String.self, forKey: CodingKeys.kind)
        url = try values.decode(URL.self, forKey: CodingKeys.url)
        
        if let description = try? values.decode(String.self, forKey: CodingKeys.description) {
            self.description = description
        } else {
            let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
            description = (try? additionalValues.decode(String.self, forKey: AdditionalKeys.longDescription)) ?? ""
        }
    }
}

struct StoreItems: Codable {
    let results: [StoreItem]

}

extension URL {

    func withQueries(_ queries: [String: String]) -> URL? {

        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

let query: [String: String] = [
    "term": "tyler the creator",
    "media": "music",
    "lang": "en_us",
    "limit": "10"
]

func matchItems(matching query: [String: String], completion: @escaping ([StoreItem]?) -> Void) {
    let baseURL = URL(string: "https://itunes.apple.com/search?")!
    
    guard let url = baseURL.withQueries(query) else {
        completion(nil)
        print("Unable to form url.")
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let decoder = JSONDecoder()
        if let data = data, let storeItems = try? decoder.decode(StoreItems.self, from: data) {
            completion(storeItems.results)
        } else {
            print("No data returned or data unable to be decoded.")
            completion(nil)
            return
        }
    }
    task.resume()
}

matchItems(matching: query) { (fetchedInfo) in
    guard let info = fetchedInfo else { return }
    print(info)
}
/*:

 _Copyright © 2018 Apple Inc._

 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_

 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._

 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 */
