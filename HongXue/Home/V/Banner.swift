import UIKit

class Banner: UIView{
    
    var urlArr = [URL]()
    
    var CollectionView: UICollectionView?
    var flowlayout = UICollectionViewFlowLayout()
    var pageControl = UIPageControl()
    var timer = Timer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        HXNetwork.RegisterWithURLSession { (urlArr) in
            
            DispatchQueue.main.async {
                self.urlArr =  urlArr
                self.createSubviews(frame: frame)
                self.addTimer()
            }
        }
        
    }
    
    func createSubviews(frame: CGRect){
        CollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
            , collectionViewLayout: flowlayout)
        flowlayout.itemSize = CGSize(width:frame.size.width, height:frame.size.height)
        flowlayout.minimumInteritemSpacing = 0;
        flowlayout.minimumLineSpacing = 0;
        flowlayout.scrollDirection = UICollectionViewScrollDirection.horizontal
        CollectionView!.backgroundColor = UIColor.lightGray
        CollectionView!.isPagingEnabled = true
        CollectionView!.dataSource  = self
        CollectionView!.delegate = self
        CollectionView!.showsHorizontalScrollIndicator = false
        CollectionView!.showsVerticalScrollIndicator = false
        CollectionView!.register(BannerCell.self, forCellWithReuseIdentifier: "cell")
        self.addSubview(CollectionView!)
        //        let indexP = IndexPath(item: 2, section: 0)
        //        CollectionView?.scrollToItem(at: indexP, at: .centeredVertically, animated: true)
        pageControl = UIPageControl.init(frame: CGRect(x:0,y: 0,width:frame.size.width / 2,height:30))
        pageControl.center = CGPoint(x:frame.size.width / 2, y:frame.size.height - 20);
        self.addSubview(pageControl);
        
        
    }
    
    func addTimer(){
        let timer1 = Timer.init(timeInterval: 20, target: self, selector: #selector(nextPageView), userInfo: nil, repeats: true)
        
        RunLoop.current.add(timer1, forMode: RunLoopMode.commonModes)
        timer = timer1
    }
    
    @objc func nextPageView(){
        
        let indexPath =
            self.CollectionView!.indexPathsForVisibleItems.last
        var nextItem = (indexPath!.item) + 1;
        
        var section = indexPath!.section;
        //滑动到最后一个item的时候，下一个变为下一Section的第一个
        if nextItem == urlArr.count {
            nextItem = 0
            section += 1
        }
        if section == 99 {
            timer.invalidate()
        }
        self.pageControl.currentPage = nextItem;
        let nextIndexPath = IndexPath(row: nextItem , section: section)
        
        CollectionView!.scrollToItem(at: nextIndexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Banner:UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = CollectionView?.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BannerCell
        cell.url = urlArr[indexPath.item]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urlArr.count
    }
    
}



extension Banner:UICollectionViewDelegateFlowLayout {
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //
    //        return UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return 45
    //    }
    //
    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        return CGSize(width: ScreenWidth - 120 ,  height: 150)
    //    }
    
    
    
}
