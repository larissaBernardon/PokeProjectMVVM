//
//  DataProviderStruct.swift
//  PokemonProject
//
//  Created by Tag Livros on 03/01/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import Foundation

struct DataProvider<T> {
    
    enum EditingStyle {
        case insert([T], [IndexPath], Bool)
        case delete([T], [IndexPath], Bool)
        case reload(T, IndexPath)
        case reloadAll
    }
    
    var elements: [[T]]
    
    var editingStyle: EditingStyle {
        didSet {
            switch editingStyle {
            case let .insert(objects, indexPaths, isNewSection):
                if isNewSection {
                    var sections = indexPaths.map { $0.section }
                    sections = Array(Set(sections))
                    for section in sections {
                        elements.insert(objects, at: section)
                    }
                } else {
                    for (object, indexPath) in zip(objects, indexPaths) {
                        if elements.indices.contains(indexPath.section) {
                            elements[indexPath.section].insert(object, at: indexPath.row)
                        } else {
                            elements.insert([object], at: elements.endIndex)
                        }
                    }
                }
                
            case let .delete(_, indexPaths, _):
                for index in indexPaths {
                    elements[index.section].remove(at: index.row)
                    if elements[index.section].count == 0 {
                        elements.remove(at: index.section)
                    }
                }
                
            case let .reload(obj, indexPath):
                elements[indexPath.section][indexPath.row] = obj
            default:
                break
            }
        }
    }
    
    init(withElements elements: [[T]]? = nil) {
        if let newElements = elements {
            self.elements = newElements
        } else {
            self.elements = []
        }
        self.editingStyle = .reloadAll
    }
}

protocol ViewModelProtocol: class {
    associatedtype Element
    var loader: Observable<Bool> { get }
    var dataProvider: Observable<DataProvider<Element>> { get }
    var error: Observable<Error?> { get }

    subscript(section: Int) -> [Element] { get }
    subscript(section: Int, row: Int) -> Element { get }
    subscript<R>(section: Int, r: R) -> ArraySlice<Element> where R: RangeExpression, Array<Element>.Index == R.Bound { get }
}
