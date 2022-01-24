//
//  UIImageView.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import AVFoundation
import Kingfisher
import UIKit

extension UIImageView {
    func setImageWith(urlString imageUrl: String?, placeholder: Placeholder? = nil) {
        // Limit memory cache size to 100 MB.
        ImageCache.default.memoryStorage.config.totalCostLimit = 100 * 1024 * 1024
        // Limit memory cache to hold 30 images at most.
        ImageCache.default.memoryStorage.config.countLimit = 30
        // Memory image expires after 10 minutes.
        ImageCache.default.memoryStorage.config.expiration = .seconds(600)
        // means that the disk cache would expire in one week.
        ImageCache.default.diskStorage.config.expiration = .days(7)

        let urlString = imageUrl?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let url = URL(string: urlString)
        let sampleSize = CGSize(width: frame.size.width * UIScreen.main.scale, height: frame.size.height * UIScreen.main.scale)
        let processor = DownsamplingImageProcessor(size: sampleSize)
        kf.setImage(with: url, placeholder: placeholder, options: [.backgroundDecode,
                                                                   .cacheOriginalImage,
                                                                   .processor(processor)])
    }

    func setImageColor(color: UIColor) {
        let templateImage = image?.withRenderingMode(.alwaysTemplate)
        image = templateImage
        tintColor = color
    }
}

extension UIImageView {
    func getThumbnailImageFromVideoUrl(url: String?, placeholder: UIImage? = nil, completion: ((_ image: UIImage?) -> Void)? = nil) {
        if let placeholder = placeholder {
            image = placeholder
        }
        guard let url = url else { return }
        let cache = ImageCache.default
        if cache.isCached(forKey: url) {
            // retrive cached image for this name from cache
            getImageFromCacheWith(key: url) { [weak self] result in
                switch result {
                case let .success(cacheImage):
                    if let image = cacheImage.image {
                        self?.image = image
                        completion?(image)
                    } else {
                        self?.getThumbnailImageFromVideoUrl(url: url, completion: completion)
                    }
                case let .failure(error):
                    print(error)
                    completion?(nil)
                }
            }
        } else {
            getThumbnailImageFromVideoUrl(url: url, completion: completion)
        }
    }

    private func getImageFromCacheWith(key: String?, completion: @escaping (Result<ImageCacheResult, KingfisherError>) -> Void) {
        guard let key = key else { return }
        let cache = ImageCache.default
        cache.retrieveImage(forKey: key) { result in
            completion(result)
        }
    }

    private func saveImageToCacheWith(key: String?, image: UIImage?) {
        guard let key = key, let image = image else { return }
        let cache = ImageCache.default
        cache.store(image, forKey: key)
    }

    private func getThumbnailImageFromVideoUrl(url: String, completion: ((_ image: UIImage?) -> Void)?) {
        DispatchQueue.global().async { // 1
            if let url = URL(string: url) {
                let asset = AVAsset(url: url) // 2
                let avAssetImageGenerator = AVAssetImageGenerator(asset: asset) // 3
                avAssetImageGenerator.appliesPreferredTrackTransform = true // 4
                let thumnailTime = CMTimeMake(value: 2, timescale: 1) // 5
                do {
                    let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumnailTime, actualTime: nil) // 6
                    let thumbImage = UIImage(cgImage: cgThumbImage) // 7
                    DispatchQueue.main.async { // 8
                        self.image = thumbImage
                        completion?(thumbImage) // 9
                    }
                } catch {
                    print(error.localizedDescription) // 10
                    DispatchQueue.main.async {
                        completion?(nil) // 11
                    }
                }
            }
        }
    }
}
