//
//  SizeSliderView.swift
//  NovelReader
//
//  Created by Rafael Basso on 03/04/23.
//

import UIKit

class SizeSliderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    /// Method used to add subviews and set custom view settings inside.
    private func setupView() {
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
    private func setupLayout() {}
}
