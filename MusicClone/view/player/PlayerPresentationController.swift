//
//  PlayerPresentationController.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/25.
//

import UIKit

class PlayerPresentationController: UIPresentationController {
    /** CustomPresentation
     ViewController - (화면 표시 PresentationController (dismiss전까지 view를 관리)
     UIPresentationController (subClassing) + TransitioningDelegate
     
     Presentation -> Management -> Dissmissal
     
     1. presentation
            -> presentationTransitionWillBegin() : 트랜지션에서 사용하는 커스텀뷰 추가 애니메이션 속성 추가
                        
                                트랜지션 시작 -> 화면 전환
            -> containerViewWillLayoutSubviews
            -> containerViewDidLayoutSubviews : 커스텀뷰 배치
            -> presentationTransitionDidEnd : 화면에 표시 Management로 돌입
     
     2. Management (디바이스 회전등)
     
            -> viewWillTransition(to:with:) : 화면에 변화가 생기면 여기가 호출 여기서 프레임 직접 업데이트
     
     3. Dismissal
     
            -> dismissalTransitionWillBegin: 닫는 트랜지션 시작
     
                                트랜지션 시작 -> 전환
            -> containerViewWillLayoutSubviews
            -> containerViewDidLayoutSubviews : 애니메이션이 시작되는 동안 실행됨 -
            
                                트랜지션 완료
            -> dismissalTransitionDidEnd:  닫는 트랜지션 끝
                            
     
     
     
     
     */

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }

    
    override var presentationStyle: UIModalPresentationStyle{
        UIModalPresentationStyle.fullScreen
    }
    override var frameOfPresentedViewInContainerView: CGRect {
        CGRect(origin: CGPoint(x: 0, y: 0 ),
               size: CGSize(width: self.containerView!.frame.width, height: self.containerView!.frame.height ))
    }
    
    override func presentationTransitionWillBegin() {
        print(#function)
    }
    override func presentationTransitionDidEnd(_ completed: Bool) {
        print(#function)
    }
    
    
    override func dismissalTransitionWillBegin() {
        print(#function)
    }
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        print(#function)
    }
    
    
    override func containerViewWillLayoutSubviews() {
        print(#function)
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    override func containerViewDidLayoutSubviews() {
        print(#function)
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print(#function)
    }
    
    @objc func dismiss(){
        presentedViewController.dismiss(animated: true)
    }
}
