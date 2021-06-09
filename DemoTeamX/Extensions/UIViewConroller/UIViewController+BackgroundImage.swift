

import UIKit

extension UIViewController {
    func setBackgroungImage(){
        let backgroundImageView = UIImageView(frame: self.view.frame)
        backgroundImageView.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImageView, at: 0)
    }
}
