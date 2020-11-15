import UIKit
//import Lottie
import FirebaseDatabase


class FirstViewController: UIViewController {

    //let animationView = AnimationView()
    
    //private func setupAnimation(){
   //     animationView.animation = Animation.named("7751-load")
     //   animationView.frame = view.bounds
       // animationView.contentMode = .scaleAspectFit
      //  animationView.loopMode = .loop
    //  animationView.play()
        //view.addSubview(animationView)
   // }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // setupAnimation()
        let ref = Database.database().reference()
        ref.child("someid/name").setValue("Mike")
    }


    
    @IBAction func LearnPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func ProgressPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func infoPressed(_ sender: UIButton) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if UserDefaults.standard.bool(forKey: "hasViewedWalkthrough"){
            return
        }
        
              let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
              if let walkthroughViewController = storyboard.instantiateViewController(identifier: "WalkthroughViewController") as? WalkthroughViewController{
                walkthroughViewController.modalPresentationStyle = .fullScreen
                  present(walkthroughViewController, animated: true, completion: nil)
              }
              
          
    }
        
    
}



