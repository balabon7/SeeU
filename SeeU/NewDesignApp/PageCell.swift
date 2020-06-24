//
//  PageCell.swift
//  SeeU
//
//  Created by mac on 24.06.2020.
//  Copyright © 2020 sashabalabon. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let unwrapperPage = page else { return }
            imageView.image = UIImage(named: unwrapperPage.image)
            
            let attributedText = NSMutableAttributedString(string: unwrapperPage.tittle, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append( NSMutableAttributedString(string: "\n\n" + unwrapperPage.description, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.gray]))
            
            desctiptionTextView.attributedText = attributedText
            desctiptionTextView.textAlignment = .center
        }
    }
    
    let imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "placeholder"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    let desctiptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Title", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append( NSMutableAttributedString(string: "\n\n" + "Description", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        
        return textView
    }()
    
    private let topImageContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviewAllView()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func addSubviewAllView() {
        topImageContainerView.addSubview(imageView)
        addSubview(desctiptionTextView)
        addSubview(topImageContainerView)
    }
    
    // MARK: - AutoLayout
    fileprivate func setupAutoLayout() {
        
        //TopImageContainerView
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        //Image View
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.65).isActive = true
        imageView.widthAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.65).isActive = true
        
        //TextView
        desctiptionTextView.translatesAutoresizingMaskIntoConstraints = false
        desctiptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 20).isActive = true
        
        desctiptionTextView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 37).isActive = true
        desctiptionTextView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -37).isActive = true
        desctiptionTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}


