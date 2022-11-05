




import UIKit
/*
    加载试图控制器的时候，如果xib和控制器的名字一样 优先加载xib
 */
class WBComposeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!//文本框
    
    @IBOutlet weak var toolBar: UIToolbar!//底部工具栏
    
    @IBOutlet weak var toolBarBottomCons: NSLayoutConstraint!
    
    /// 标题标签- 换行热键 - option + 回车
    /// 选中label的属性为  Attribute， 如果想要调整行间距，可以增加一个空行，设置空行的字体。lineHeight 设置常熟
    @IBOutlet var titleLabel: UILabel!
    
    // MARK:- xib加载发布按钮
    @IBOutlet var sendButton: UIButton!
    
    // MARK:- 发布微博
    @IBAction func sendButtonClick(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        // MARK:- 监听键盘的改变
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardChanged), name: .UIKeyboardWillChangeFrame, object: nil)
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        textView.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
    }
    
    func close() -> Void {
        dismiss(animated: true, completion: nil)
    }
    
    func keyboardChanged(no: Notification) -> Void {
        
//        print(no.userInfo)
        
        //1 获取目标的 rect
        guard let rect = (no.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else{
            return
        }
        //获取键盘弹出的时间
        guard let duration = (no.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue else{
            return
        }
        
        //2 设置底部的约束高度
        let offset = view.bounds.height - rect.origin.y
        
        //3 跟新底部约束
        toolBarBottomCons.constant = offset
        
        //4 动画跟新
        UIView.animate(withDuration: duration) { 
//            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }
}


extension WBComposeViewController{
    
    func setupUI() -> Void {
        view.backgroundColor = UIColor.white
        setupNavgationBar()
        setupToolBar()
    }
    
    func setupNavgationBar() -> Void {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", target: self, action: #selector(close))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: sendButton)
        sendButton.isEnabled = false
        
        navigationItem.titleView = titleLabel
    }
    
    func setupToolBar() -> Void {
        
        let itemSettings = [["imageName": "compose_toolbar_picture"],
                            ["imageName": "compose_mentionbutton_background"],
                            ["imageName": "compose_trendbutton_background"],
                            ["imageName": "compose_emoticonbutton_background", "actionName": "emoticonKeyboard"],
                            ["imageName": "compose_add_background"]]
        
        var itemArray = [UIBarButtonItem]()
        
        for item in itemSettings {
            let btn = UIButton()
            guard let imgName = item["imageName"] else{
                continue
            }
            let img = UIImage(named: imgName)
            let highlightImg = UIImage(named: imgName + "_highlighted")
            
            btn.setImage(img, for: .normal)
            btn.setImage(highlightImg, for: .highlighted)
            btn.sizeToFit()
            //追加按钮
            itemArray.append(UIBarButtonItem(customView: btn))
            
            //追加弹簧
            itemArray.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        }
        
        itemArray.removeLast()
        toolBar.items = itemArray
    }
    
}
