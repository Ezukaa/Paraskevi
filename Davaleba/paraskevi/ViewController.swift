

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Shemovida")
        let APIResult = getAPI()
        
        APIResult.parseJson { (result) in
            print(result.results.count)
        }
        

    }
    
    
    
    

}
    

