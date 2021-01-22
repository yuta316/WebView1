//
//  ViewController.swift
//  WebView1
//
//  Created by 石川裕太 on 2021/01/22.
//
//
import UIKit
//webkitのimport
import WebKit

//WKNavigationDelegate デリゲートの開始,終了を教える
class ViewController: UIViewController, WKNavigationDelegate{
    @IBOutlet weak var indicater: UIActivityIndicatorView!
    
    //web viewのインスタンス化
    var webView = WKWebView()
    
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    //インディケーター
    override func viewDidLoad() {
        super.viewDidLoad()
        //隠す
        indicater.isHidden = true
        //web画面の大きさ決める
        webView.frame = CGRect(x:0 ,y:0, width: view.frame.size.width, height: view.frame.size.height-toolbar.frame.height)
        //viewにwebviewをはる.
        view.addSubview(webView)
        
        //プロコトルを自分に割り当て
        webView.navigationDelegate = self
        
        //urlのロード//String->URLへキャスト
        let url = URL(string: "https://cookpad.com/")
        //requestにセット
        let request = URLRequest(url: url!)
        //webviewにセット
        webView.load(request)
        //インディケーターの階層あげる
        indicater.layer.zPosition = 2
    }
    
    //ロードが完了された時に呼ばれるデリゲートメソッド
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        indicater.isHidden = true
        indicater.stopAnimating()
    }
    //ロードが開始された時に呼ばれるデリゲートメソッド
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
        indicater.isHidden = false
        indicater.startAnimating()
    }


    //戻る
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    //進む
    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
}

