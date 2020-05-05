//
//  RNsimpleTotp.swift
//  RNsimpleTotp
//
//  Created by pc libelula on 30/04/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation

@objc(RNTotplibe)
class RNTotplibe: NSObject {
   
 let DIGITS_POWER: [Int] = [1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000]
    let doubleDigits: [Int] = [0, 2, 4, 6, 8, 1, 3, 5, 7, 9]
    
   
    @objc
    func getTOTP(semilla: String, tiempo: String, fecha: String, resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) -> Void {
      
        // let fecha_token = fecha
        // let tiempo2: Int = Int(tiempo)!
        // let window = UInt64(tiempo2*1000)/1000
        
        // var fecha:Date = Date()
        // if fecha_token != "" {
        //     let dateFormatter = getDateFormatted4()
        //     fecha = dateFormatter.date(from: fecha_token)!
        // }
        
        // let date: Int = Int(fecha.timeIntervalSince1970)
        // let time = UInt64(date*1000)/1000
        // let counter = (time / window)
        
        // let valor = generateTOTP(semilla, movingFactor: counter, codeDigits: 6)
     
         resolve(["yfytfvtyytyyff"]);
    }

    
    func generateTOTP(_ secret: String, movingFactor: UInt64, codeDigits: Int) -> String {
        
        var movingFactor_: UInt64 = movingFactor
        
        var text: [UInt8] = [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        for i in (0..<text.count).reversed() {
            text[i] = UInt8(movingFactor_ & 0xff)
            movingFactor_ = movingFactor_ >> 8
        }
        
        let hash:[UInt8] = hmac(CryptoAlgorithm.SHA1, key: secret, cData: text)
        let offset: Int = Int(hash[hash.count - 1] & 0xf)
        
        
        let B0 = Int(hash[offset + 3] & 0xff)
        let B1 = Int(hash[offset + 2] & 0xff)
        let B2 = Int(hash[offset + 1] & 0xff)
        let B3 = Int(hash[offset] & 0x7f)
        
        let binary: Int = B3 << 24 | B2 << 16 | B1 << 8 | B0 << 0
        
        let otp = binary % DIGITS_POWER[codeDigits]
        return "\(otp)"
    }
      func getDateFormatted4() -> DateFormatter {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.timeZone = TimeZone(identifier: "America/Guayaquil")
            dateFormatter.locale = Locale(identifier: "es-EC")
    //        dateFormatter.locale = Locale(identifier: Locale.current.identifier)
    //        dateFormatter.timeZone = TimeZone(identifier: TimeZone.current.identifier)
            
            return dateFormatter
    }
    enum CryptoAlgorithm {
        case MD5, SHA1, SHA224, SHA256, SHA384, SHA512

        var HMACAlgorithm: CCHmacAlgorithm {
            var result: Int = 0
            switch self {
            case .MD5:      result = kCCHmacAlgMD5
            case .SHA1:     result = kCCHmacAlgSHA1
            case .SHA224:   result = kCCHmacAlgSHA224
            case .SHA256:   result = kCCHmacAlgSHA256
            case .SHA384:   result = kCCHmacAlgSHA384
            case .SHA512:   result = kCCHmacAlgSHA512
            }
            return CCHmacAlgorithm(result)
        }

        var digestLength: Int {
            var result: Int32 = 0
            switch self {
            case .MD5:      result = CC_MD5_DIGEST_LENGTH
            case .SHA1:     result = CC_SHA1_DIGEST_LENGTH
            case .SHA224:   result = CC_SHA224_DIGEST_LENGTH
            case .SHA256:   result = CC_SHA256_DIGEST_LENGTH
            case .SHA384:   result = CC_SHA384_DIGEST_LENGTH
            case .SHA512:   result = CC_SHA512_DIGEST_LENGTH
            }
            return Int(result)
        }
    }

    //extension String {
        func hmac(_ algorithm: CryptoAlgorithm, key: String, cData: [UInt8]) -> [UInt8] {
            let cKey = key.cString(using: String.Encoding.utf8)
            let keyLen = key.lengthOfBytes(using: String.Encoding.utf8)

            let dataLen = cData.count

            var result = [UInt8](repeating: 0, count: Int(algorithm.digestLength))
            CCHmac(algorithm.HMACAlgorithm, cKey!, keyLen, cData, dataLen, &result)

            return result


        }

    
}
