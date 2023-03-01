import Foundation

class NetworkService {
    func get<T: Decodable>(model: T,
                           service: ServiceProtocol,
                           completion: @escaping (Result<T, Error>) -> Void) {
        let request = makeRequest(service: service)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(T.self, from: data)
                completion(.success(model))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }
        task.resume()
    }

    private func makeRequest(service: ServiceProtocol) -> URLRequest {
        let url = service.baseUrl.appendingPathComponent(service.path)

        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.allHTTPHeaderFields = service.headers
        request.httpMethod = service.method.rawValue

        return request
    }
}
