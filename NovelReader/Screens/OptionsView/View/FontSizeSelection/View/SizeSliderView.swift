//
//  SizeSliderView.swift
//  NovelReader
//
//  Created by Rafael Basso on 03/04/23.
//

import UIKit

class SizeSliderView: UIView {

    private let SLIDER_MINIMUM_VALUE: Float = 12
    private let SLIDER_MAXIMUM_VALUE: Float = 48
    private let SLIDER_STEP: Float = 2
    
    private(set) lazy var slider: UISlider = {
        var symbolConfiguration = UIImage.SymbolConfiguration(paletteColors: [.white])
        symbolConfiguration = symbolConfiguration.applying(UIImage.SymbolConfiguration(font: .boldSystemFont(ofSize: 26)))
        
        let minimumImage = UIImage(systemName: "textformat.size.smaller", withConfiguration: symbolConfiguration)
        let maximumImage = UIImage(systemName: "textformat.size.larger", withConfiguration: symbolConfiguration)
        
        let slider = UISlider()
        slider.isContinuous = true
        slider.minimumValue = SLIDER_MINIMUM_VALUE
        slider.maximumValue = SLIDER_MAXIMUM_VALUE
        slider.minimumValueImage = minimumImage
        slider.maximumValueImage = maximumImage
        slider.minimumTrackTintColor = .white
        slider.maximumTrackTintColor = .gray
        slider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
        return slider
    }()
    
    weak var delegate: SliderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    /// Method used to add subviews and set custom view settings inside.
    private func setupView() {
        layoutMargins = UIEdgeInsets(top: 25, left: 10, bottom: 25, right: 10)
        
        addSubview(slider)
        
        UIView.animate(withDuration: 0.5) {
            self.slider.value = 30
        }
        
        setupLayout()
    }
    
    /// Method used to setup any layout associated with the current view and its subviews.
    ///
    /// An easier and more readable way to activate your constraints is to use:
    /// ```swift
    ///     NSLayoutConstraint.activate([
    ///         // Constraints to activate...
    ///     ])
    /// ```
    private func setupLayout() {
        slider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slider.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            slider.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            slider.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])
    }
}

@objc
extension SizeSliderView {
    private func sliderValueDidChange(_ sender: UISlider!) {
        let roundedStepValue = round(sender.value / SLIDER_STEP) * SLIDER_STEP
        sender.value = roundedStepValue
        delegate?.sliderValueDidChange(to: roundedStepValue)
    }
}
