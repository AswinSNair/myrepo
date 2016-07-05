 //
//  ViewController.m
//  MyFirstApp
//
//  Created by qburst on 22/06/16.
//  Copyright © 2016 qburst. All rights reserved.
//


#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "DetailViewController.h"

@interface ViewController (){
    
    AddViewController *viewController;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self CopyDatabase];
    myData = [[NSMutableArray alloc]initWithArray:[self readFromPlistFile]];
    
    //    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"database" ofType:@"plist"];
    //    NSMutableDictionary *plistdict = [NSMutableDictionary dictionaryWithContentsOfFile:dataPath];
    //    [plistdict writeToFile:filePath atomically:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   /* if ([[segue identifier] isEqualToString:@"AddViewController"])
    {
        // Get reference to the destination view controller
        AddViewController *vc = [segue destinationViewController];
        vc.delegate = self;
        
        // Pass any objects to the view controller here, like...
    }*/
    
    if([[segue identifier] isEqualToString:@"DetailViewController"])
    {
        NSIndexPath *indexPath = nil;
        indexPath = [_tableRow indexPathForSelectedRow];
        PersonalInfo *personalInfo = [myData objectAtIndex:indexPath.row];
        
        DetailViewController *detailView = [segue destinationViewController];
        
        detailView.personalInfo = personalInfo;
    }
    /*  if([[segue identifier] isEqualToString:@"editSegue"])
     {
     NSIndexPath *indexPath = nil;
     indexPath = [_tableRow indexPathForSelectedRow];
     PersonalInfo *personalInfo = [myData objectAtIndex:indexPath.row];
     
     AddViewController *editdetail = [segue destinationViewController];
     
     editdetail.personalInfo = personalInfo;
     }*/
}

#pragma mark - Table View Data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section
{
    return [myData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellID";

    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    PersonalInfo *personalInfo = [myData objectAtIndex:indexPath.row];
    cell.labelName.text = personalInfo.name;
    cell.labelEmail.text = personalInfo.email;
    cell.thisImageView.clipsToBounds = YES;
    cell.thisImageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.thisImageView.image = [UIImage imageWithData:personalInfo.imageData];
    cell.delegate = self;
    cell.indexPath = indexPath;
    return cell;
}

#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // NSLog(@"%ld",indexPath.row);
}

- (IBAction)plusButton:(id)sender
{
    //viewController = [[AddViewController alloc] init];
    //[self.navigationController pushViewController:viewController animated:YES];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                @"Main" bundle:[NSBundle mainBundle]];
    AddViewController *myController = [storyboard instantiateViewControllerWithIdentifier:@"AddViewController"];
    myController.delegate = self;
    [self.navigationController pushViewController:myController animated:YES];

}

- (void)addViewController:(AddViewController *)addViewController didAddedNewPersonalInfo:(PersonalInfo *)personalInfo
{
    [myData addObject:personalInfo];
    [self writeToPlistFile];
    [self.tableRow reloadData];
    
}

-(void)addViewController:(AddViewController *)addViewController didEditedPersonalInfo:(PersonalInfo *)personalInfo atIndex:(NSInteger)index
{
    [myData replaceObjectAtIndex:index withObject:personalInfo];
    [self writeToPlistFile];
    [self.tableRow reloadData];

}

-(void)customTableViewCell:(CustomTableViewCell *)customTableViewCell didClickedEditButton:(NSIndexPath *)indexPath
{
    PersonalInfo *personalInfo = [myData objectAtIndex:indexPath.row];
    personalInfo = [myData objectAtIndex:indexPath.row];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                @"Main" bundle:[NSBundle mainBundle]];
    AddViewController *myController = [storyboard instantiateViewControllerWithIdentifier:@"AddViewController"];
    myController.delegate = self;
    [self.navigationController pushViewController:myController animated:YES];
    myController.personalInfo = personalInfo;
    myController.didEdit = YES;
    myController.indexPath = indexPath;
    
    NSLog(@"%ld", indexPath.row);
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (NSString*)DatabasePath
{
    NSArray *Paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *DocumentDir = [Paths objectAtIndex:0];
    //NSLog(@"%@",DocumentDir);
    return [DocumentDir stringByAppendingPathComponent:@"mydatabase1.plist"];
    
}

- (void)CopyDatabase
{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    success = [fileManager fileExistsAtPath:[self DatabasePath]];
    NSString *FileDB = [[NSBundle mainBundle] pathForResource:@"DetailsPropertyList" ofType:@"plist"];
    if (success)
    {
        NSLog(@"File Exist");
        return;
    }
    else
    {
        [fileManager copyItemAtPath:FileDB toPath:[self DatabasePath] error:nil];
    }
    
}

- (BOOL)writeToPlistFile{
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:myData];
    BOOL didWriteSuccessfull = [data writeToFile:[self DatabasePath] atomically:YES];
    return didWriteSuccessfull;
}

- (NSArray*)readFromPlistFile
{
    NSData * data = [NSData dataWithContentsOfFile:[self DatabasePath]];
    return  [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end