//
//  Tweak.xm
//  WhatsApp UnlimitedMSG
//
//  Created by iMokhles on 10/6/13.
//  Copyright (c) 2013-2014 iMokhles LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

static UIBarButtonItem *selectAllButton;
static BOOL selectedAll = NO;
static BOOL Value = YES;

%hook SinglePersonPicker

%new(v@:)
-(void)toggleSelectAll
{
    selectedAll=!selectedAll;
    [selectAllButton setTitle:(selectedAll?@"Deselect All":@"Select All")];

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath 
{
// Return NO if you do not want the specified item to be editable.
return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath 
{
return UITableViewCellEditingStyleDeleteInsert;
}


 - (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath 
 {
 return NO;
 }

- (void)viewDidLoad {

if (Value) {

%orig;

selectAllButton = [[UIBarButtonItem alloc] initWithTitle:@"Select All" style:UIBarButtonItemStylePlain target:self action:@selector(toggleSelectAll)];
        [[self navigationItem] setLeftBarButtonItem:selectAllButton animated:NO];
    } else {
        [[self navigationItem] setLeftBarButtonItem:nil animated:NO];
        [selectAllButton release];

   }
}

%end