import LCARSDisplayKit
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ViewControllerRepresentable()
    }
}

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController()!
        return viewController as! ViewController
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

#Preview {
    ContentView()
}
