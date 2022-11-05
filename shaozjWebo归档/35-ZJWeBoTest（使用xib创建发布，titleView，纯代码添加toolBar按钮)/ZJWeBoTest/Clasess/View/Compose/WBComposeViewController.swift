




import UIKit
/*
    加载试图控制器的时候，如果xib和控制器的名字一样 优先加载xib
 */
class WBComposeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!//文本框
    
    @IBOutlet weak var toolBar: UIToolbar!//底部工具栏
    
    
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
       
    }

    func close() -> Void {
        dismiss(animated: true, completion: nil)
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
