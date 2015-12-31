//
//  ViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 15/12/30.
//  Copyright © 2015年 MiaoLizhuang. All rights reserved.
//

#import "ViewController.h"
#import "DDXMLElementAdditions.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString * xmlPath = [[NSBundle mainBundle] pathForResource:@"documentTest" ofType:@"xml"];
    NSString * xmlString = [[NSString alloc]initWithContentsOfFile:xmlPath encoding:NSUTF8StringEncoding error:nil];
    
    DDXMLDocument * dcu = [[DDXMLDocument alloc]initWithXMLString:xmlString options:0 error:nil];
    DDXMLNode *xmlNote = [dcu rootElement];
    NSArray * array = xmlNote.
    NSLog(@"%@",xmlString);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
