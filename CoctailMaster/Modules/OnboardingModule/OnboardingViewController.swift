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

    private func setupUI() {

        view.backgroundColor = .commonBlue

        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        view.addSubview(stackView)

        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        stackView.addArrangedSubview(titleLabel)

        infoLabel.textAlignment = .center
        infoLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        infoLabel.numberOfLines = 2
        infoLabel.textColor = .white
        stackView.addArrangedSubview(infoLabel)

        button.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        view.addSubview(button)

        makeConstraints()
    }

    private func makeConstraints() {
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
