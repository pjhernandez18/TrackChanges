//
//  PostViewController.swift
//  TrackChanges
//
//  Created by Nolan Earl on 10/15/18.
//  Copyright © 2018 TrackChanges. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var postText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        postText.text = "What are you listening to?"
        postText.textColor = UIColor.lightGray
        
        postText.becomeFirstResponder()
        
        postText.selectedTextRange = postText.textRange(from: postText.beginningOfDocument, to: postText.beginningOfDocument)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText:String = textView.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
        
        if updatedText.isEmpty {
            
            postText.text = "What are you listening to?"
            postText.textColor = UIColor.lightGray
            
            postText.selectedTextRange = postText.textRange(from: postText.beginningOfDocument, to: postText.beginningOfDocument)
        } else if postText.textColor == UIColor.lightGray && !text.isEmpty {
            postText.textColor = UIColor.black
            postText.text = text
        } else {
            return true
        }
        return false
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if self.view.window != nil {
            if postText.textColor == UIColor.lightGray {
                postText.selectedTextRange = postText.textRange(from: postText.beginningOfDocument, to: postText.beginningOfDocument)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
