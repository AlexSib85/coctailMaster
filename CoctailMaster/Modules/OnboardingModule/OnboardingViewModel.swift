//
//  RootViewModel.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import Foundation

struct OnboardingInfo {
    var title: String
    var info: String
    var buttonTitle: String
}

protocol OnboardingViewModelOutput: AnyObject {
    func updateWith(onbordingInfo: OnboardingInfo)
}

class OnboardingViewModel {

    private var dataService: DataService
    weak var coordinator: OnboardingCoordinator?
    weak var output: OnboardingViewModelOutput?

    var onboardingInfo: OnboardingInfo?

    init(dataService: DataService, coordinator: OnboardingCoordinator) {
        self.dataService = dataService
        self.coordinator = coordinator
    }

    deinit {
        print("DEINIT OnboardingViewModel")
    }

    func viewLoaded() {
        loadData()
    }

    func didFinishOnboarding() {
        coordinator?.didFinishOnboarding()
    }

    private func loadData() {
        let onboardingInfo = OnboardingInfo(title: "Добро пожаловать", info: "в демо приложение", buttonTitle: "Далее")
        self.onboardingInfo = onboardingInfo
        output?.updateWith(onbordingInfo: onboardingInfo)
    }
}
