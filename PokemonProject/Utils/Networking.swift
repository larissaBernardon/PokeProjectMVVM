//
//  Networking.swift
//  PokemonProject
//
//  Created by Tag Livros on 03/01/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import Foundation
import Alamofire

enum Result<T> {
    case success(T)
    case error(Error)
}

enum DefaultNetworkingMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
    case put = "PUT"
    
    func getMethod() -> HTTPMethod {
        switch self {
        case .get:
            return HTTPMethod.get
        case .post:
            return HTTPMethod.post
        case .patch:
            return HTTPMethod.patch
        case .put:
            return HTTPMethod.put
        case .delete:
            return HTTPMethod.delete
        }
    }
}

enum DefaultEncoding {
    case `default`
    case queryString
    case json
    case arrayQuery
    func getEncoding() -> ParameterEncoding {
        switch self {
        case .default:
            return URLEncoding.default
        case .queryString:
            return URLEncoding.queryString
        case .json:
            return JSONEncoding.default
        case .arrayQuery:
            return URLEncoding(arrayEncoding: .noBrackets)
        }
    }
}

struct NetworkingUploadResult {
    var data: Data?
    var time: Double?
    
    init(_ data: Data?, time: Double? = nil) {
        self.data = data
        self.time = time
    }
}

protocol NetworkingProtocol: class {
    typealias NetworkingDataCompletion = ((Result<Data?>) -> Void)
    typealias NetWorkingUploadCompletion = ((Result<NetworkingUploadResult>) -> Void)
    
    func request(_ path: String,
                 method: DefaultNetworkingMethod,
                 encoding: DefaultEncoding,
                 parameters: [String: Any],
                 completion: @escaping NetworkingDataCompletion)
}

extension NetworkingProtocol {
    func request(_ path: String,
                 method: DefaultNetworkingMethod = .get,
                 encoding: DefaultEncoding = .default,
                 parameters: [String: Any],
                 completion: @escaping NetworkingDataCompletion) {
        request(path,
                method: method,
                encoding: encoding,
                parameters: parameters,
                completion: completion)
    }
}

class Networking {
    /// Default interface
    private let httpInterface: SessionManager
    
    /// Default Alamofire initialization
    private var alamoFireManager: Alamofire.SessionManager = { () -> Alamofire.SessionManager in
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        let manager = Alamofire.SessionManager(configuration: configuration)
        return manager
    }()
    
    // MARK: - Initializer
    
    /// Initialize the Api with initial configurations
    ///
    /// - Parameter httpInterface: Optional http interface delegate of the type: SessionManager
    init(httpInterface: SessionManager = SessionManager()) {
        self.httpInterface = httpInterface
    }
}

extension Networking: NetworkingProtocol {
    func request(_ path: String,
                 method: DefaultNetworkingMethod,
                 encoding: DefaultEncoding,
                 parameters: [String: Any],
                 completion: @escaping NetworkingDataCompletion) {

        do {
            
            let url = "https://pokeapi.co/api/v2/\(path)"
    
            self.httpInterface.request(url,
                                       method: method.getMethod(),
                                       parameters: parameters,
                                       encoding: encoding.getEncoding(),
                                       headers: nil)
                .validate()
                .responseJSON(queue: DispatchQueue.global(qos: DispatchQoS.QoSClass.default),
                              options: JSONSerialization.ReadingOptions.allowFragments) { (response: DataResponse) in
                Helper.responseJSON(result: response)
                switch response.result {
                case .success:
                    completion(Result.success(response.data))
                case .failure(let error):
                    if let error = error as? AFError {
                        switch error {
                        case .responseSerializationFailed(reason: let reason):
                            if case .inputDataNilOrZeroLength = reason {
                                completion(Result.success(nil))
                            }
                        default:
                            completion(Result.error(error))
                        }
                    } else {
                        completion(Result.error(error))
                    }
                }
            }
        }
    }
}
