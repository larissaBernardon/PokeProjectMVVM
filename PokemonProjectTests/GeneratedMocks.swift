// MARK: - Mocks generated from file: PokemonProject/Screens/PokemonList/ViewModel/PokemonViewModel.swift at 2020-01-08 22:39:43 +0000

//
//  PokemonViewModel.swift
//  PokemonProject
//
//  Created by Tag Livros on 08/01/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import Cuckoo
@testable import PokemonProject

import Foundation


 class MockPokemonViewModel: PokemonViewModel, Cuckoo.ClassMock {
    
     typealias MocksType = PokemonViewModel
    
     typealias Stubbing = __StubbingProxy_PokemonViewModel
     typealias Verification = __VerificationProxy_PokemonViewModel

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: PokemonViewModel?

     func enableDefaultImplementation(_ stub: PokemonViewModel) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var networking: PokemonNetworking {
        get {
            return cuckoo_manager.getter("networking",
                superclassCall:
                    
                    super.networking
                    ,
                defaultCall: __defaultImplStub!.networking)
        }
        
        set {
            cuckoo_manager.setter("networking",
                value: newValue,
                superclassCall:
                    
                    super.networking = newValue
                    ,
                defaultCall: __defaultImplStub!.networking = newValue)
        }
        
    }
    
    
    
     override var dataProvider: Observable<DataProvider<PokemonCellViewModel>> {
        get {
            return cuckoo_manager.getter("dataProvider",
                superclassCall:
                    
                    super.dataProvider
                    ,
                defaultCall: __defaultImplStub!.dataProvider)
        }
        
        set {
            cuckoo_manager.setter("dataProvider",
                value: newValue,
                superclassCall:
                    
                    super.dataProvider = newValue
                    ,
                defaultCall: __defaultImplStub!.dataProvider = newValue)
        }
        
    }
    
    
    
     override var loader: Observable<Bool> {
        get {
            return cuckoo_manager.getter("loader",
                superclassCall:
                    
                    super.loader
                    ,
                defaultCall: __defaultImplStub!.loader)
        }
        
        set {
            cuckoo_manager.setter("loader",
                value: newValue,
                superclassCall:
                    
                    super.loader = newValue
                    ,
                defaultCall: __defaultImplStub!.loader = newValue)
        }
        
    }
    
    
    
     override var error: Observable<Error?> {
        get {
            return cuckoo_manager.getter("error",
                superclassCall:
                    
                    super.error
                    ,
                defaultCall: __defaultImplStub!.error)
        }
        
        set {
            cuckoo_manager.setter("error",
                value: newValue,
                superclassCall:
                    
                    super.error = newValue
                    ,
                defaultCall: __defaultImplStub!.error = newValue)
        }
        
    }
    

    

    
    
    
     override func getPokemons(offset: Int, limit: Int)  {
        
    return cuckoo_manager.call("getPokemons(offset: Int, limit: Int)",
            parameters: (offset, limit),
            escapingParameters: (offset, limit),
            superclassCall:
                
                super.getPokemons(offset: offset, limit: limit)
                ,
            defaultCall: __defaultImplStub!.getPokemons(offset: offset, limit: limit))
        
    }
    

	 struct __StubbingProxy_PokemonViewModel: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var networking: Cuckoo.ClassToBeStubbedProperty<MockPokemonViewModel, PokemonNetworking> {
	        return .init(manager: cuckoo_manager, name: "networking")
	    }
	    
	    
	    var dataProvider: Cuckoo.ClassToBeStubbedProperty<MockPokemonViewModel, Observable<DataProvider<PokemonCellViewModel>>> {
	        return .init(manager: cuckoo_manager, name: "dataProvider")
	    }
	    
	    
	    var loader: Cuckoo.ClassToBeStubbedProperty<MockPokemonViewModel, Observable<Bool>> {
	        return .init(manager: cuckoo_manager, name: "loader")
	    }
	    
	    
	    var error: Cuckoo.ClassToBeStubbedProperty<MockPokemonViewModel, Observable<Error?>> {
	        return .init(manager: cuckoo_manager, name: "error")
	    }
	    
	    
	    func getPokemons<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(offset: M1, limit: M2) -> Cuckoo.ClassStubNoReturnFunction<(Int, Int)> where M1.MatchedType == Int, M2.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, Int)>] = [wrap(matchable: offset) { $0.0 }, wrap(matchable: limit) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPokemonViewModel.self, method: "getPokemons(offset: Int, limit: Int)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_PokemonViewModel: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var networking: Cuckoo.VerifyProperty<PokemonNetworking> {
	        return .init(manager: cuckoo_manager, name: "networking", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var dataProvider: Cuckoo.VerifyProperty<Observable<DataProvider<PokemonCellViewModel>>> {
	        return .init(manager: cuckoo_manager, name: "dataProvider", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var loader: Cuckoo.VerifyProperty<Observable<Bool>> {
	        return .init(manager: cuckoo_manager, name: "loader", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var error: Cuckoo.VerifyProperty<Observable<Error?>> {
	        return .init(manager: cuckoo_manager, name: "error", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func getPokemons<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(offset: M1, limit: M2) -> Cuckoo.__DoNotUse<(Int, Int), Void> where M1.MatchedType == Int, M2.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, Int)>] = [wrap(matchable: offset) { $0.0 }, wrap(matchable: limit) { $0.1 }]
	        return cuckoo_manager.verify("getPokemons(offset: Int, limit: Int)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class PokemonViewModelStub: PokemonViewModel {
    
    
     override var networking: PokemonNetworking {
        get {
            return DefaultValueRegistry.defaultValue(for: (PokemonNetworking).self)
        }
        
        set { }
        
    }
    
    
     override var dataProvider: Observable<DataProvider<PokemonCellViewModel>> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<DataProvider<PokemonCellViewModel>>).self)
        }
        
        set { }
        
    }
    
    
     override var loader: Observable<Bool> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<Bool>).self)
        }
        
        set { }
        
    }
    
    
     override var error: Observable<Error?> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<Error?>).self)
        }
        
        set { }
        
    }
    

    

    
     override func getPokemons(offset: Int, limit: Int)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

