//
//  TopTextFieldDelegate.swift
//  MemeMeDraft3
//
//  Created by ALCALY LO on 12/27/17.
//  Copyright © 2017 ALCALY LO. All rights reserved.
//

import Foundation
import UIKit

class TextFieldDelegate : NSObject, UITextFieldDelegate {
    
    // Construct the text that will be in the field if this change is accepted
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    // Dismiss Keyboard UponPressing Return
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
}
