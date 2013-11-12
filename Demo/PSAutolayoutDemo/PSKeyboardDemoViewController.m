//
//  PSKeyboardDemoViewController.m
//  PSAutolayoutDemo
//
//  Created by Steven Hepting on 11/11/13.
//  Copyright (c) 2013 Hepting. All rights reserved.
//

#import "PSKeyboardDemoViewController.h"
#import "PSKeyboardDemoView.h"
#import "YMKeyboardLayoutHelperView.h"

@interface PSKeyboardDemoViewController ()
@property (nonatomic, strong) NSArray *cellNames;
@property (nonatomic, strong) PSKeyboardDemoView *demoView;
@end

@implementation PSKeyboardDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.demoView = [[PSKeyboardDemoView alloc] init];
    self.view = self.demoView;
    
    self.demoView.tableView.delegate = self;
    self.demoView.tableView.dataSource = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped:)];
    [self.view addGestureRecognizer:tap];
    
    self.demoView.keyboardHelper.scrollView = self.demoView.tableView;
    self.demoView.keyboardHelper.inputView = self.demoView.textField;
    
    [self.demoView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"StandardCell"];
    
    self.cellNames = @[@"First", @"Second", @"Third", @"Fourth", @"Fifth", @"Sixth", @"Seventh", @"Eighth", @"Ninth", @"Tenth", @"Eleventh"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cellNames count];
}

- (void)backgroundTapped:(id)sender
{
    NSLog(@"Background tapped.");
    [self.demoView endEditing:YES];
}


- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.demoView.tableView dequeueReusableCellWithIdentifier:@"StandardCell"];
    [cell addSubview:[[UITextView alloc] init]];
    
    cell.textLabel.text = self.cellNames[indexPath.row];
    
    return cell;
}

@end
