//
//  ImageLoader.swift
//  OpenSeaWidgets
//
//  Created by Oleksii Skliarenko on 03.07.2021.
//

import UIKit

class ImageLoader {
    public static let shared = ImageLoader()
    
    private let cachedImages = NSCache<NSURL, UIImage>()
    private var handlers = [NSURL: [(UIImage?) -> ()]]()
    
    fileprivate init() {}
    
    final func load(url: NSURL, completion: @escaping (UIImage?) -> ()) -> Cancellable? {
        if let cachedImage = cachedImage(url: url) {
            DispatchQueue.main.async {
                completion(cachedImage)
            }
            return nil
        }

        if handlers[url] != nil {
            handlers[url]?.append(completion)
            return nil
        } else {
            handlers[url] = [completion]
        }
    
        let task = URLSession(configuration: .default).dataTask(with: url as URL) {[unowned self] (data, response, error) in
            guard let responseData = data,
                  let image = UIImage(data: responseData),
                  let blocks = self.handlers[url],
                  error == nil else {
                completion(nil)
                return
            }

            self.cachedImages.setObject(image, forKey: url, cost: responseData.count)
            blocks.forEach { $0(image) }
        }
        
        task.resume()
        return task
    }
    
    private func cachedImage(url: NSURL) -> UIImage? {
        return cachedImages.object(forKey: url)
    }
}
