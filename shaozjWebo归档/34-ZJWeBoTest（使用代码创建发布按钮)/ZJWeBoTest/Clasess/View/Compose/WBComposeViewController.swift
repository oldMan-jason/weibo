




import UIKit
/*
    加载试图控制器的时候，如果xib和控制器的名字一样 优先加载xib
 */
class WBComposeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!//文本框
    
    @IBOutlet weak var toolBar: UIToolbar!//底部工具栏
    
    lazy var sendButton: UIButton = {
        
        let btn = UIButton()
        btn.setTitle("发布", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.lightGray, for: .disabled)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.setBackgroundImage(UIImage(named: "common_button_orange"), for: .normal)
        btn.setBackgroundImage(UIImage(named: "common_button_orange_highlighted"), for: .highlighted)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: .disabled)
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 35)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
       
    }

    func close() -> Void {
        dismiss(animated: true, completion: nil)
    }
    
}


extension WBComposeViewController{
    
    func setupUI() -> Void {
        view.backgroundColor = UIColor.white
        setupNavgationBar()
    }
    
    func setupNavgationBar() -> Void {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", target: self, action: #selector(close))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: sendButton)
        sendButton.isEnabled = false
    }
    
}
