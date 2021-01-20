//
//  TestPresenter.swift
//  template-clean-archi
//
//  Created by Fromage Charley on 04/12/2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol TestPresentationLogic
{
  func presentSomething(response: Test.Something.Response)
}

class TestPresenter: TestPresentationLogic
{
  weak var viewController: TestDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Test.Something.Response)
  {
    let viewModel = Test.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}