//
//  HTTPRequestManager.swift
//  Alamofire
//
//  Created by Ramilia Imankulova on 8/7/18.
//

import Foundation
import Alamofire
import SystemConfiguration

class HTTPRequestManager {
    
    typealias SuccessHandler = (Data?) -> ()
    typealias FailureHandler = (String)-> ()
    typealias Parameter = [String: Any]?
    
    
    private func request(method: HTTPMethod, endpoint: String, parameters: Parameter, completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        
        if !isConnectedToNetwork() {
            error(Constants.Network.ErrorMessage.NO_INTERNET_CONNECTION)
            return
        }
        
        let apiUrl = "http://46.101.146.101:8081/" + endpoint
        
        
        let header: HTTPHeaders = [:]
        
        Alamofire.request(apiUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!, method: method, parameters: parameters, encoding: URLEncoding.default , headers: header).responseJSON { (response:DataResponse<Any>) in
            
            guard response.response != nil else {
                error(Constants.Network.ErrorMessage.UNABLE_LOAD_DATA)
                return
            }
            
            guard let statusCode = response.response?.statusCode else {
                error(Constants.Network.ErrorMessage.NO_HTTP_STATUS_CODE)
                return
            }
            
            print("\(statusCode) - \(apiUrl)")
            
            switch(statusCode) {
            case HTTPStatusCode.badRequest.statusCode:
                error("Bad Request: 400")
            case HTTPStatusCode.ok.statusCode,
                 HTTPStatusCode.accepted.statusCode,
                 HTTPStatusCode.created.statusCode:
                
                completion(response.data)
                break
            default:
                error(response.error?.localizedDescription ?? "Server Error")
            }
        }
    }
    
    
    internal func post(endpoint: String, parameters: Parameter, completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        request(method: .post, endpoint: endpoint, parameters: parameters, completion: completion, error: error)
    }
    internal func get(endpoint: String,  completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        request(method: .get, endpoint: endpoint, parameters: nil, completion: completion, error: error)
    }
    internal func get(endpoint: String, parameters: Parameter, completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        request(method: .get, endpoint: endpoint, parameters: parameters, completion: completion, error: error)
    }
    
    
    
    // MARK: - Internet Connectivity
    
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    func getRequestHeader() -> HTTPHeaders {
        return [:]
    }
    
}

