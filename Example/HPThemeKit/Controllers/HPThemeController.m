//
//  HPThemeController.m
//  HPThemeWork_Example
//
//  Created by hapii on 2019/1/17.
//  Copyright © 2019年 hapiii. All rights reserved.
//

#import "HPThemeController.h"
//#import "HttpDownLoad.h"
#import "HPThemeCell.h"
#import "HPThemeManager.h"
#import "HPThemeModel.h"
#import "HPColorTable.h"



@interface HPThemeController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *ThemeCollectionView;
@property(nonatomic,strong)NSMutableArray<HPThemeModel *> *datas;

@end
@implementation HPThemeController

-(void)viewDidLoad{

    [self configUI];
    [self loadData];
}
-(void)configUI{
    
    [self.view addSubview:self.ThemeCollectionView];
    self.view.dk_backgroundColorPicker = HPColorPickerWithKey(kContentKeywordTextColor);

      [self.ThemeCollectionView registerNib:[UINib nibWithNibName:@"HPThemeCell" bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([HPThemeCell class])];
     self.ThemeCollectionView.dk_backgroundColorPicker = HPColorPickerWithKey(kContentKeywordTextColor);
}

-(void)loadData{
    
    HttpDownLoad *http=[[HttpDownLoad alloc] initWithURLStr:@"http://i.gtimg.cn/qqshow/admindata/comdata/vipList_theme_new/xydata.all.v2.js" Post:NO DataDic:@{} Block:^(HttpDownLoad *xx, BOOL isSuccess) {
        if (isSuccess) {
            [self jsonValue:xx.data];
            [self.ThemeCollectionView reloadData];
        }else{
            //[self.view makeToast:@"下载失败"];

        }

    }];
    http=nil;
    
    
   
    
}
-(void)jsonValue:(NSData*)data{
    
    NSString*str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSRange range=[str rangeOfString:@"{"];
    str=[str substringWithRange:NSMakeRange(range.location, str.length-range.location)];
    
    //解析
    NSDictionary*dic=[NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    
    //读取detailList
    NSDictionary*detailListDic=dic[@"detailList"];
    //读取allvalue
    NSArray*array=[detailListDic allValues];
    //遍历所有的value,剔除掉损坏的无法使用的主题
    
   
    [self.datas removeAllObjects];
    
    for (NSDictionary*tempDic in array) {
        //读取对应id值
        HPThemeModel *model = [[HPThemeModel alloc] initWithDatas:tempDic];
       
        
        if (model.themeID.length>0) {
            [self.datas addObject:model];
        }
    }
}

#pragma mark===delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HPThemeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(HPThemeCell.class)  forIndexPath:indexPath];
   cell.theme = self.datas[indexPath.row];
    
    return cell;
}
// 设置cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(120.0f, 150.0f);
}

//返回行内部cell（item）之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

//返回行间距 上下间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return (CGSize){KScreenWidth,44};
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return (CGSize){KScreenWidth,22};
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HPThemeModel *theme = self.datas[indexPath.row];
    [[HPThemeManager shareManager] downLoadThemeWithTheme:theme Handle:^(downLoadStates state) {
        switch (state) {
            case HasExit:
               // [self.view makeToast:@"已存在"];
                
                break;
            case DownLoadSuccess:
               // [self.view makeToast:@"下载成功"];
               
                break;
            case DownLoadFail:
               // [self.view makeToast:@"下载失败"];
                break;
                
            default:
                break;
        }
        
    }];
    
}

#pragma mark ==========================lazy

-(UICollectionView *)ThemeCollectionView{
    if (_ThemeCollectionView==nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake(120.0f, 150.0f);
        layout.minimumLineSpacing = 0.0f;
        layout.minimumInteritemSpacing = 0.0f;
        _ThemeCollectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
        _ThemeCollectionView.backgroundColor = [UIColor whiteColor];
        _ThemeCollectionView.delegate = self;
        _ThemeCollectionView.dataSource = self;
    }
    return _ThemeCollectionView;
}

-(NSMutableArray *)datas{
    if (_datas==nil) {
        _datas = [NSMutableArray new];
    }
    return _datas;
}
@end
