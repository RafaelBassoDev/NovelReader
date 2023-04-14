//
//  SliderViewDelegate.swift
//  NovelReader
//
//  Created by Rafael Basso on 14/04/23.
//

import Foundation

protocol SliderViewDelegate: AnyObject {
    func sliderValueDidChange(to value: Float)
}
