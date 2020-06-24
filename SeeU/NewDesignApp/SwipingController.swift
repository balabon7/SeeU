//
//  SwipingController.swift
//  SeeU
//
//  Created by mac on 24.06.2020.
//  Copyright © 2020 sashabalabon. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    private let pages = [
        Page(tittle: "Гидромассаж для глаз", image: "PalmsHydro", description: "Первое упражнение делаем утром, либо вечером когда вы умываетесь. Упражнения укрепляет сосуды глаза. Сначала вы умываетесь горячей водой, и старайтесь какое-то время подержать руки с водой прямо на глаза, а после резко менять экран на холодную воду. И также старайтесь поддержать холодную воду ладошках на глазах. Буквально три таких контрастных ванн для глаз"),
        Page(tittle: "Фокусировка на цели", image: "fartherСloserАinger", description: "Второе упражнение. Берёте палец и относительно его на расстоянии 10-15 см. Смотрите на кончик пальца глазами и начинайте приближать палец к носу. И в конце смотрите на кончик своего носа. После, также удаляете палец от глаз на расстояния 10-15 см и следите за ним. И так, повторяйте десять раз. Вы подводите палец к носу и убирайте его обратно и следите глазами"),
        Page(tittle: "Рисование линий", image: "closeOpenEye", description: "Третье упражнения это сильное сжимание и разжимание глаз. Вы сильно сжали глаза, чтобы зажмуриться и сильно разжали. И так повторяйте 10 раз. А между этими упражнениями вы легко и быстро помограли глазами, и переходите к следующему упражнению"),
        Page(tittle: "Сжатие и разжатие глаз", image: "doubleCross", description: "Упражнение номер четыре это рисование линий глазами. Первая часть упражнение это вертикальные движения глазами вверх-вниз с максимальной скоростью и амплитудой. А вторая часть упражнение это движение глазами только горизонтально. Также с максимальной скоростью. И в конце сделайте движения по диагонали, как можно быстрее. Также повторяйте 10 раз"),
        Page(tittle: "Рисование пяти фигур", image: "finalFiveFigures", description: "Пятое упражнение состоит из рисования пяти фигур. Каждую фигуру рисуем глазами 10 раз. Нужно нарисовать ромб, круг, восьмёрку, треугольник и квадрат. Каждый фигуру по десять раз. Первые пять раз по часовой стрелке вторые  против часовой"),
        Page(tittle: "Восстановление аккомодации", image: "moonHands", description: "Шестое упражнение самое важное и должно быть последним. Нам нужен какой-то близкий предмет и отдалённый. Отдалённый предмет может быть шпиль дома, а близким — цветок на подоконнике либо палец. Сначала мы фокусируемся на близкой точке, далее переводим фокус на отдалённые предмет. И так, нужно постоянно менять положение глаз. Именно после это упражнение вы почувствуете что острота зрения усилилась. Это упражнения можно сделать 10–20 раз. В промежутке, не забывайте поморгать, чтобы глаза не устали")]
    
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPinkColor
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        
        return pc
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.mainPinkColor, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func handlePrev() {
        print("handleNext")
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handleNext() {
        print("handleNext")
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    fileprivate func setupBottomControls() {
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.axis = .horizontal
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x/view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupBottomControls()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    private func setupCollectionView(){

          collectionView?.backgroundColor = .white
          collectionView?.register(PageCell.self, forCellWithReuseIdentifier: cellId)
          collectionView?.isPagingEnabled = true
          collectionView.showsHorizontalScrollIndicator = false
      }


    
    // MARK: - CollectionView Flow Layout Protocols
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    // MARK: - CollectionView Protolols
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
}

// MARK: -  viewWillTransition
extension SwipingController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            if self.pageControl.currentPage == 0 {
                self.collectionView.contentOffset = .zero
            }
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }, completion: nil)
    }
}
