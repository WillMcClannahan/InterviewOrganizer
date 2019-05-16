

import UIKit

class NoteDetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var note: Note?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Note"
        
        if let note = note {
            titleTextField.text = note.title
            bodyTextView.text = note.body
        }
    }
    
    @IBAction func save(_ sender: Any) {
        guard let title = titleTextField.text else {
            alertNotifyUser(message: "Note not saved.\nThe title is not accessible.")
            return
        }
        
        let noteTitle = title.trimmingCharacters(in: .whitespaces)
        if (noteTitle == "") {
            alertNotifyUser(message: "Note not saved.\nA title is required.")
            return
        }
        
        let body = bodyTextView.text ?? ""
        
        if note == nil {
            // note doesn't exist, create new one
            note = Note(title: noteTitle, body: body)
        } else {
            // document exists, update existing one
            note?.title = title
            note?.body = body
        }
        
        if let note = note {
            do {
                let managedContext = note.managedObjectContext
                try managedContext?.save()
            } catch {
                alertNotifyUser(message: "The note context could not be saved.")
            }
        } else {
            alertNotifyUser(message: "The note could not be created.")
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func alertNotifyUser(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel) {
            (alertAction) -> Void in
            print("OK selected")
        })
        
        self.present(alert, animated: true, completion: nil)
    }
}
