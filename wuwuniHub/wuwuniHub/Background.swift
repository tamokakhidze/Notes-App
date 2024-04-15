import UIKit

public func createOnBoardingBackground(view: UIView, name: String) -> UIImageView {
    let imageView = UIImageView()
    imageView.image = UIImage(named: name)
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(imageView)
    
    NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: view.topAnchor),
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
    
    return imageView
    
}
