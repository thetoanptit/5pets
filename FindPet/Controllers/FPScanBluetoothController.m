//
//  FPScanBluetoothController.m
//  FindPet
//
//  Created by tungnd on 3/21/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPScanBluetoothController.h"
#import "Logging.h"

@interface FPScanBluetoothController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation FPScanBluetoothController

- (void)viewDidLoad {
    [super viewDidLoad];
    LogTrace(@"IN");
    // Do any additional setup after loading the view.
    LogTrace(@"OUT");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    LogTrace(@"IN");
    // Dispose of any resources that can be recreated.
    LogTrace(@"OUT");
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    LogTrace(@"IN-OUT");
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LogTrace(@"IN-OUT");
    return nil;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
