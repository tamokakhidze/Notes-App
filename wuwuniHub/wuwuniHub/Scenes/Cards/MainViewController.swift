import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func getInputText() -> [String?]
}

class MainViewController: UIViewController {
    
    weak var delegate: MainViewControllerDelegate?
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    var image = UIImage() //??
    var collectionView: UICollectionView?
    var titlesArray = [String]()
    var descriptionsArray = [String]()
    var imagesArray = [String]()
    var addNewCardButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        let background = createOnBoardingBackground(view: view, name: "Rectangle 1")
        view.addSubview(background)
        customizeCollectionView()
        view.sendSubviewToBack(background)
        addNewCardButton = createAddNewCardButton()
        view.addSubview(addNewCardButton)
        addNewCardButton.addTarget(self, action: #selector(navigateToNewCardVC), for: .touchUpInside)
        updateCollectionView()
    }
    
    func customizeCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 16
        let itemWidth: CGFloat = 152
        let itemHeight: CGFloat = 196
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 77).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -290).isActive = true //ოდნავ ჩანდეს მეხუთეც
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let inputText = delegate?.getInputText() {
            titlesArray.append(inputText[0]!)
            descriptionsArray.append(inputText[1]!)
            updateCollectionView()
        }
        
    }
    
    func createAddNewCardButton() -> UIButton {
        let button = UIButton()
        let color = UIColor(red: 0/255, green: 117/255, blue: 255/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 290).isActive = true
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.setTitle("ახალი ბარათის დამატება", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "FiraGO-Regular", size: 14)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = color
        view.addSubview(button)
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 660).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return button
    }
    
    private func updateCollectionView() {
        collectionView?.reloadData()
    }
    
    @objc func navigateToNewCardVC() {
        let newCardVc = AddNewCardViewController()
        newCardVc.delegate = self
        navigationController?.pushViewController(newCardVc, animated: true)
    }
    
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titlesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        if let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCell {
            customCell.configure(titleText: titlesArray[indexPath.row], descriptionText: descriptionsArray[indexPath.row], imageName: imagesArray[indexPath.row])
            cell = customCell
        }
        
        return cell
    }

}

extension MainViewController: AddNewCardViewControllerDelegate {
    
    func newCardAdded(title: String, description: String, image: String) {
        titlesArray.append(title)
        descriptionsArray.append(description)
        imagesArray.append(image)
        collectionView?.reloadData()
    }
}

extension MainViewController: UICollectionViewDelegate {
    
}

#Preview {
    MainViewController()
}
