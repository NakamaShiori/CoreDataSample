//
//  GrobalStruct.swift
//  TableViewSample
//
//  Created by N on 2015/11/01.
//  Copyright (c) 2015年 Nakama. All rights reserved.
//

import UIKit

struct GlobalColor{
    
    //共通の色一覧
    static let Black = UIColorFromHex("#030303", alpha: 1)
    static let Orange = UIColorFromHex("#EA6D3B", alpha: 1)
    static let White = UIColorFromHex("#FFFFFF", alpha: 1)
    static let WhiteGray = UIColorFromHex("#F7F6F4", alpha: 1)
    static let LightGray = UIColorFromHex("#F0EFEB", alpha: 1)
    static let MiddleGray = UIColorFromHex("#AFAFAF", alpha: 1)
    static let Gray = UIColorFromHex("#878787", alpha: 1)
    static let DarkGray = UIColorFromHex("#4A4A4A", alpha: 1)
    
    static let Pink = UIColorFromHex("#FF5F5F", alpha: 1)

}

struct GlobalFont{
    
    static let title = UIFont(name: "HiraKakuProN-W3", size: 18)
    static let title_bold = UIFont(name: "HiraKakuProN-W6", size: 18)
    static let large = UIFont(name: "HiraKakuProN-w3", size: 17)
    static let large_bold = UIFont(name: "HiraKakuProN-w6", size: 17)
    static let middle = UIFont(name: "HiraKakuProN-w3", size: 15)
    static let middle_bold = UIFont(name: "HiraKakuProN-w6", size: 15)
    static let small = UIFont(name: "HiraKakuProN-w3", size: 14)
    static let small_bold = UIFont(name: "HiraKakuProN-w6", size: 14)
    static let detail = UIFont(name: "HiraKakuProN-W3", size: 11)
    static let detail_bold = UIFont(name: "HiraKakuProN-W6", size: 11)
    
}

struct ScreenSize{
    
    //スクリーンサイズ
    static let Width = UIScreen.mainScreen().bounds.width
    static let Height = UIScreen.mainScreen().bounds.height
    
}

struct Margin {
    static let midium:CGFloat = 10
    static let small:CGFloat = 5
}

