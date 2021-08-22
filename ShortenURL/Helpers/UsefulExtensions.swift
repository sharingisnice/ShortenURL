//
//  UsefulExtensions.swift
//  ShortenURL
//
//  Created by Mert Ejder on 23.08.2021.
//

import UIKit

extension UIView {
    
    static let loadingViewTag = 1938123987
    func showLoading(style: UIActivityIndicatorView.Style = .large) {
        var loading = viewWithTag(UIImageView.loadingViewTag) as? UIActivityIndicatorView
        if loading == nil {
            loading = UIActivityIndicatorView(style: style)
        }
        
        loading?.translatesAutoresizingMaskIntoConstraints = false
        loading!.startAnimating()
        loading!.hidesWhenStopped = true
        loading?.tag = UIView.loadingViewTag
        loading?.frame = self.frame
        addSubview(loading!)
        loading?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        loading?.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            let loading = self.viewWithTag(UIView.loadingViewTag) as? UIActivityIndicatorView
            loading?.stopAnimating()
            loading?.removeFromSuperview()
        }
    }
    
}
