//
//  Constants.swift
//  SampleShop
//
//  Created Ku Ku Zan on 19/04/2022.
//

import Foundation

enum AssetsColor: String {
    case btnTextColor = "BtnTextColor"
    case primaryColor = "PrimaryColor"
    case primaryTextColor = "PrimaryTextColor"
    case secondaryTextColor = "SecondaryTextColor"
    case tertiaryTextColor = "TertiaryTextColor"
    case searchbarBGColor = "SearchBarBGColor"
}

enum ValidationErrors: String {
    case usernameError = "Username is Required!"
    case passwordError = "Password is Required!"
}

enum StepperControl: Int {
    case minus = 0, plus
}
