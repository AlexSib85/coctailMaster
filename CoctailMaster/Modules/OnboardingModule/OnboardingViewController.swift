//
//  ViewController.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit

class OnboardingViewController: UIViewController {

    var viewModel: OnboardingViewModel!

    @UsesAutoLayout private var stackView = UIStackView()
    @UsesAutoLayout private var titleLabel = UILabel()
    @UsesAutoLayout private var infoLabel = UILabel()
    @UsesAutoLayout private var button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewLoaded()
    }

    deinit {
        print("DEINIT OnboardingViewController")
    }

    private func setupUI() {

        view.backgroundColor = .commonBlue

        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        view.addSubview(stackView)

        titleLabel.textAlignment = .center
        stackView.addArrangedSubview(titleLabel)

        infoLabel.textAlignment = .center
        stackView.addArrangedSubview(infoLabel)

        button.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        stackView.addArrangedSubview(button)

        makeConstraints()
    }

    private func makeConstraints() {
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    @objc
    private func closeTapped() {
        viewModel.didFinishOnboarding()
    }
}

extension OnboardingViewController: OnboardingViewModelOutput {
    func updateWith(onbordingInfo: OnboardingInfo) {
        titleLabel.text = onbordingInfo.title
        infoLabel.text = onbordingInfo.info
        button.setTitle(onbordingInfo.buttonTitle, for: .normal)
    }
}
