//
//  GrobalUtility.swift
//  TableViewSample
//
//  Created by N on 2015/10/30.
//  Copyright (c) 2015年 Nakama. All rights reserved.
//

import UIKit

//レイアウトチェックの色付けのON/OFF
var isLayoutCheck:Bool = false

//UIntに16進で数値をいれるとUIColorが戻る関数
func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

//HexColorをいれるとUIColorが戻る関数
func UIColorFromHex (var hexStr : NSString, alpha : CGFloat) -> UIColor {
    hexStr = hexStr.stringByReplacingOccurrencesOfString("#", withString: "")
    let scanner = NSScanner(string: hexStr as String)
    var color: UInt32 = 0
    if scanner.scanHexInt(&color) {
        let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(color & 0x0000FF) / 255.0
        return UIColor(red:r,green:g,blue:b,alpha:alpha)
    } else {
        print("invalid hex string", terminator: "")
        return UIColor.blackColor();
    }
}

//再生時間数をISO8601から00:00:00形式に変換
func ConvertISO(iso:String) -> String{
    var string = iso
    var hour = "00"
    var minute = "00"
    var second = "00"
    if let _ = string.rangeOfString("PT"){
        string = iso.componentsSeparatedByString("PT")[1]
    }
    if let _ = string.rangeOfString("H"){
        hour = string.componentsSeparatedByString("H")[0]
        string = string.componentsSeparatedByString("H")[1]
        if Int(hour) < 10{
            hour = "0\(hour)"
        }
    }
    if let _ = string.rangeOfString("M"){
        minute = string.componentsSeparatedByString("M")[0]
        string = string.componentsSeparatedByString("M")[1]
        if Int(minute) < 10{
            minute = "0\(minute)"
        }
    }
    if let _ = string.rangeOfString("S"){
        second = string.componentsSeparatedByString("S")[0]
        if Int(second) < 10{
            second = "0\(second)"
        }
    }
    return "\(hour):\(minute):\(second)"
}

//GCD
func dispatch_async_main(block: () -> ()) {
    dispatch_async(dispatch_get_main_queue(), block)
}
func dispatch_async_global(block: () -> ()) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
}
