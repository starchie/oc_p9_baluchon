//
//  TranslateService.swift
//  Baluchon
//
//  Created by Gilles Sagot on 27/06/2021.
//

import Foundation

class TranslateService {
    
    static var shared = TranslateService()
    
    private var translateSession = URLSession(configuration: .default)
    private var task: URLSessionDataTask?
    
    private init () {}

    init(translateSession: URLSession) {
        self.translateSession = translateSession
    }
    
    func start(){
        TranslateService.shared = TranslateService()
    }
    
    
    
    func getTranslation(sentence: String, source: String, completionHandler: @escaping ((Bool, String?, TranslationResult? ) -> Void)) {
        
        let translateUrl = getTranslationUrl()
        
        var request = URLRequest(url: translateUrl)
        request.httpMethod = "POST"
        
        let body = "key=\(key.translation)&q=\(sentence)&source=\(source)&target=en&format=text"
        request.httpBody = body.data(using: .utf8)
        
        task?.cancel()
        
        task = translateSession.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    print ("ERROR: \(String(describing: error?.localizedDescription))")
                    completionHandler (false, Settings.shared.errorData,nil)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print ("ERROR: \(String(describing: response))")
                    completionHandler (false, Settings.shared.errorReponseTranslate, nil)
                    return
                }
                guard let result = try? JSONDecoder().decode(TranslationResult.self, from: data) else {
                    print("JSON ERROR: \(String(describing: error?.localizedDescription))")
                    completionHandler (false, Settings.shared.errorJson, nil)
                    return
                }
                
                completionHandler (true, nil, result)
            }
            
        }
        task?.resume()
    }
    
    func getLanguage(sentence: String, completionHandler: @escaping ((Bool, String?, String? ) -> Void)) {
        
        let detectUrl = getDetectionUrl(sentence: sentence)
        
        var request = URLRequest(url: detectUrl)
        request.httpMethod = "POST"
        
        let body = "key=\(key.translation)&q=\(sentence)"
        request.httpBody = body.data(using: .utf8)
        
        task?.cancel()
        
        task = translateSession.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    print ("ERROR: \(String(describing: error?.localizedDescription))")
                    completionHandler (false, Settings.shared.errorData,nil)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print ("ERROR: \(String(describing: response))")
                    completionHandler (false, Settings.shared.errorReponseDetect, nil)
                    return
                }
                guard let result = try? JSONDecoder().decode(DetectionResult.self, from: data) else {
                    print("JSON ERROR: \(String(describing: error?.localizedDescription))")
                    completionHandler (false, Settings.shared.errorJson, nil)
                    return
                }
                completionHandler (true, nil, result.data.detections[0][0].language)
            }
            
        }
        task?.resume()
    }
    
    private func getTranslationUrl ()->URL {
        let translateUrl = "https://translation.googleapis.com/language/translate/v2?"
        guard let resultUrl = URL(string: translateUrl) else {return URL(string:"https://translation.googleapis.com/")!}
        
        return resultUrl
        
    }
    
    private func getDetectionUrl (sentence:String)->URL {
        let detectUrl = "https://translation.googleapis.com/language/translate/v2/detect"
        guard let resultUrl = URL(string: detectUrl) else {return URL(string:"https://translation.googleapis.com/")!}
        
        return resultUrl
        
    }
    
}
