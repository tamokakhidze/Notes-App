import UIKit

class CustomCell: UICollectionViewCell {
    
    var titleLabel = UILabel()
    var descriptionLabel =  UILabel()
    var imageView = UIImageView()
    static var identifier = "CustomCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let color = UIColor(red: 38/255, green: 42/255, blue: 52/255, alpha: 1.0)
        contentView.backgroundColor = color
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        imageView = configureImageView()
        titleLabel = configureTitleLabel()
        descriptionLabel = configureDescriptionLabel()
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        print("Content view frame: \(contentView.frame)")
//        print("Title label frame: \(titleLabel.frame)")
//    }
    
    func configureImageView() -> UIImageView {
        let imageView = UIImageView()
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        //imageView.image = UIImage(named: "Frame 64")
        
        return imageView
    }

    func configureTitleLabel() -> UILabel {
        let label = UILabel()
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 116).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12).isActive = true
        label.font = UIFont(name: "FiraGO-SemiBold", size: 16)
        label.setLineHeight(24)
        label.numberOfLines = 0
        label.textColor = .white
        
        return label
    }
    
    func configureDescriptionLabel() -> UILabel {
        let label = UILabel()
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 116).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        label.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        label.font = UIFont(name: "FiraGO-Medium", size: 10)
        label.setLineHeight(15)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = UIColor(red: 94/255, green: 98/255, blue: 114/255, alpha: 1.0)


        return label
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(titleText: String, descriptionText: String, imageName: String) {
        titleLabel.text = titleText
        descriptionLabel.text = descriptionText
        imageView.image = UIImage(named: imageName)
    }
    
}

#Preview {
    CustomCell()
}
