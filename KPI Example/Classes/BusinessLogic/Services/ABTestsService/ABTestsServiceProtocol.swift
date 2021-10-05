//
//  ABTestsServiceProtocol.swift
//  KPI Example
//
//  Created by Oleksii Filobok on 30.09.2021.
//

import Foundation

protocol ABTestsServiceProtocol {

    func fetchABTest<T: ABTestProtocol>(type: T.Type) -> ABTestWrapper<T>? where T.RawValue == String
        
    /**
     Sends ABTest value to Analytics
     */
    func hitSplitTest<T: ABTestProtocol>(abTest: ABTestWrapper<T>) where T.RawValue == String
}
