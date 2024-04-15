import UIKit

protocol AddNewCardViewControllerDelegate: AnyObject {
    func newCardAdded(title: String, description: String, image: String)
}

class AddNewCardViewController: UIViewController {
    
    weak var delegate: AddNewCardViewControllerDelegate?
    var mainStackView = UIStackView()
    var inputTextField1 = UITextField()
    var inputTextField2 = UITextField()
    var label3 = UILabel()
    var image1 = UIImage(named: "Frame 64")
    var image2 = UIImage(named: "Frame 65")
    var image3 = UIImage(named: "Frame 63")
    var image4 = UIImage(named: "Frame 62")
    var image1View = UIButton()
    var image2View = UIButton()
    var image3View = UIButton()
    var image4View = UIButton()
    var selectedImageName: String?
    var addCardButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let background = createOnBoardingBackground(view: view, name: "Rectangle 1")
        view.addSubview(background)
        createMainStackView()
        view.sendSubviewToBack(background)
    }
    
    @objc func imageButtonTapped(_ sender: UIButton) {
            switch sender.tag {
            case 1:
                selectedImageName = "Frame 64"
            case 2:
                selectedImageName = "Frame 65"
            case 3:
                selectedImageName = "Frame 63"
            case 4:
                selectedImageName = "Frame 62"
            default:
                selectedImageName = ""
            }
        }
    
    
    @objc func addButtonPressed() {
        delegate?.newCardAdded(title: inputTextField1.text ?? "", description: inputTextField2.text ?? "", image: selectedImageName ?? "Frame 62")
        navigationController?.popViewController(animated: true)
    }
    
    func createMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.distribution = .fill
        mainStackView.spacing = 4
        mainStackView.translatesAutoresizingMaskIntoConstraints  = false
        mainStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 18).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -18).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 23).isActive = true
        
        inputTextField1 = createInputField(placeholder: "სათაური")
        inputTextField2 = createInputField(placeholder: "აღწერა")
        label3 = createInputLabel(text: "აირჩიეთ აიქონი")
        let iconsStackView = createIconsStackView()
        addCardButton = createButton()
        addCardButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        let emptyview = UIView()
        mainStackView.addArrangedSubview(createInputLabel(text: "სათაური"))
        mainStackView.addArrangedSubview(inputTextField1)
        mainStackView.addArrangedSubview(createInputLabel(text: "აღწერა"))
        mainStackView.addArrangedSubview(inputTextField2)
        mainStackView.addArrangedSubview(label3)
        mainStackView.addArrangedSubview(iconsStackView)
        mainStackView.addArrangedSubview(addCardButton)
        mainStackView.addArrangedSubview(emptyview)
        if let input1 = mainStackView.arrangedSubviews.firstIndex(of: inputTextField1) {
            mainStackView.setCustomSpacing(38, after: mainStackView.arrangedSubviews[input1])
        }
        if let input2 = mainStackView.arrangedSubviews.firstIndex(of: inputTextField2) {
            mainStackView.setCustomSpacing(29, after: mainStackView.arrangedSubviews[input2])
        }
        
        if let labell3 = mainStackView.arrangedSubviews.firstIndex(of: label3) {
            mainStackView.setCustomSpacing(14, after: mainStackView.arrangedSubviews[labell3])
            
        }
        
        if let stack1 = mainStackView.arrangedSubviews.firstIndex(of: iconsStackView) {
            mainStackView.setCustomSpacing(308, after: mainStackView.arrangedSubviews[stack1])
            
        }
    }
    
    func createInputLabel(text: String) -> UILabel {
        
        let labelForInput = UILabel()
        labelForInput.text = text
        labelForInput.textColor = .white
        labelForInput.textAlignment = .left
        labelForInput.font = UIFont(name: "FiraGO-Regular", size: 20)
        labelForInput.widthAnchor.constraint(equalToConstant: 310).isActive = true
        labelForInput.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return labelForInput
    }
    
    func createInputField(placeholder: String) -> UITextField {
        
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        let customColor = UIColor(red: 94/255, green: 98/255, blue: 114/255, alpha: 1.0)
        input.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: customColor])
        input.tintColor = .white
        input.textColor = .white
        input.layer.borderWidth = 1
        input.layer.cornerRadius = 9
        input.clipsToBounds = true
        input.layer.borderColor = UIColor(red: 141/255, green: 141/255, blue: 141/255, alpha: 1.0).cgColor

        input.heightAnchor.constraint(equalToConstant: 45).isActive = true
        input.widthAnchor.constraint(equalToConstant: 310).isActive = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: input.frame.height))
        input.leftView = paddingView
        input.leftViewMode = .always
        
        return input
        
    }
    
    func createIconsStackView() -> UIStackView {
        let iconStackView = UIStackView()
        iconStackView.translatesAutoresizingMaskIntoConstraints = false
        iconStackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        iconStackView.widthAnchor.constraint(equalToConstant: 241).isActive = true
        iconStackView.spacing = 27
        image1View.setBackgroundImage(image1, for: .normal)
        image2View.setBackgroundImage(image2, for: .normal)
        image3View.setBackgroundImage(image3, for: .normal)
        image4View.setBackgroundImage(image4, for: .normal)
        iconStackView.addArrangedSubview(image1View)
        iconStackView.addArrangedSubview(image2View)
        iconStackView.addArrangedSubview(image3View)
        iconStackView.addArrangedSubview(image4View)
        image1View.addTarget(self, action: #selector(imageButtonTapped(_:)), for: .touchUpInside)
        image1View.tag = 1
        image2View.addTarget(self, action: #selector(imageButtonTapped(_:)), for: .touchUpInside)
        image2View.tag = 2
        image3View.addTarget(self, action: #selector(imageButtonTapped(_:)), for: .touchUpInside)
        image3View.tag = 3
        image4View.addTarget(self, action: #selector(imageButtonTapped(_:)), for: .touchUpInside)
        image4View.tag = 4
        
        return iconStackView
    }
    
    func createButton() -> UIButton {
        let button = UIButton()
        let color = UIColor(red: 0/255, green: 155/255, blue: 16/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 132).isActive = true
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.setTitle("დამატება", for: .normal)
        button.titleLabel?.font = UIFont(name: "FiraGO-Regular", size: 14)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = color
        
        return button
    }
    
    @objc func goToZodiacPAge() {
        let mainView = MainViewController()
        mainView.delegate = self
        navigationController?.pushViewController(mainView, animated: true)
    }
    
}
extension AddNewCardViewController: MainViewControllerDelegate {
    
    
    func labelTextDidChange(_ newText: String?) {
        //
    }
    
    func getInputText() -> [String?] {
        return [inputTextField1.text, inputTextField2.text, selectedImageName]
    }
}
#Preview {
    AddNewCardViewController()
}
