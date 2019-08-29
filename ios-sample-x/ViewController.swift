//
//  ViewController.swift
//  ios-sample-x
//
//  Created by Koganezawa on 2019/08/27.
//  Copyright © 2019 Koganezawa. All rights reserved.
//

import UIKit
import Geth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // ファイルを保存するディレクトリのパスを取得
        let dataDir = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                          .userDomainMask,
                                                          true)[0]
        let keyStorePath = dataDir + "/keystore"
        print("keyStorePath: \(keyStorePath)")

        // keystore を管理してくれるやつのインスタンスを取得
        let keyStoreManager = GethNewKeyStore(keyStorePath, GethLightScryptN, GethLightScryptP)

        // アカウント作成
        let account = try! keyStoreManager?.newAccount("password")

        // アドレスを取得
        let address = account?.getAddress().getHex()
        print("address: \(address!)")

        // keystore ファイル URL
        let url = account?.getURL()
        print("url: \(url!)")
    }
}

