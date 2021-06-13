//
//  ViewModel.swift
//  push-sample
//
//  Created by iori tenma on 2021/06/14.
//

import Foundation

protocol ViewModel {
    var inputs: ViewModelInputs { get }
    var outputs: ViewModelOutputs { get }
}

protocol ViewModelInputs {
    func tableViewDidSelectRowAt(indexPath: IndexPath)
}

protocol ViewModelOutputs {
    var numberOfSections: Int { get }
    var numberOfRows: Int { get }
    func sectionTitle(section: Int) -> String
    func rowTitle(indexPath: IndexPath) -> String
}

final class ViewModelImpl:NSObject, ViewModel {
    var inputs: ViewModelInputs {
        return self
    }
    
    var outputs: ViewModelOutputs {
        return self
    }
}

extension ViewModelImpl: ViewModelInputs {
    func tableViewDidSelectRowAt(indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("てすと")
        } else if indexPath.row == 1 {
            print("てすと2")
        }
    }
}

extension ViewModelImpl: ViewModelOutputs {
    var numberOfSections: Int {
        return 1
    }

    var numberOfRows: Int {
        return 2
    }
    
    func sectionTitle(section: Int) -> String {
        return "メニュー"
    }

    func rowTitle(indexPath: IndexPath) -> String {
        if indexPath.row == 0 {
            return "てすと"
        } else if indexPath.row == 1 {
            return "てすと2"
        }
        
        return ""
    }
}
