//
//  xmlDataViewController.m
//  LZCodeTemplate
//
//  Created by MiaoLizhuang on 16/1/5.
//  Copyright © 2016年 MiaoLizhuang. All rights reserved.
//

#import "xmlDataViewController.h"

@interface xmlDataViewController (){
    
    NSDictionary * _xmlInfo;
}

@end

@implementation xmlDataViewController
-(void)viewDidLoad{
    [super viewDidLoad];
}
-(void)configureUI{
}

-(void)prepareData{
    
    
    
    NSString * xmlPath = [[NSBundle mainBundle] pathForResource:@"taskDetail" ofType:@"xml"];
    NSString * xmlString = [[NSString alloc]initWithContentsOfFile:xmlPath encoding:NSUTF8StringEncoding error:nil];
    DDXMLDocument * document = [[DDXMLDocument alloc]initWithXMLString:xmlString options:0 error:nil];
    NSArray * array = [document nodesForXPath:@"//root//operation" error:nil];
    NSMutableArray *operationArray = [[NSMutableArray alloc]init];
    for (DDXMLElement* operationElement in array) {
        NSMutableDictionary *operationInfo = [[NSMutableDictionary alloc]init];
        [operationInfo setObject:[operationElement attributeForName:@"layouttype"] forKey:@"layouttype"];
        NSMutableArray *tableArray = [[NSMutableArray alloc]init];
        for (id tableElement in [operationElement elementsForName:@"table"]) {
            NSMutableDictionary * tableInfo = [[NSMutableDictionary alloc]init];
            [tableInfo setObject:[tableElement attributeForName:@"title"] forKey:@"title"];
            [tableInfo setObject:[tableElement attributeForName:@"expend"] forKey:@"expend"];
            [tableInfo setObject:[tableElement attributeForName:@"editfield"] forKey:@"editfield"];
            [tableInfo setObject:[tableElement attributeForName:@"id"] forKey:@"id"];
            [tableInfo setObject:[tableElement attributeForName:@"columns"] forKey:@"columns"];
            NSMutableArray * trArray = [[NSMutableArray alloc]init];
            for (id trElement in [tableElement elementsForName:@"tr"]) {
                NSMutableDictionary * trInfo = [[NSMutableDictionary alloc]init];
                [trInfo setObject:[trElement attributeForName:@"parent"] forKey:@"parent"];
                
                NSMutableArray * tdArray = [[NSMutableArray alloc]init];
                for (id tdElement in [trElement elementsForName:@"td"]) {
                    NSMutableDictionary * tdInfo = [[NSMutableDictionary alloc]init];
                    
                    NSMutableArray *refuseArray = [[NSMutableArray alloc]init];
                    for (id refuseElement in [tdElement elementsForName:@"refuse"]) {
                        NSMutableDictionary * refuseInfo = [[NSMutableDictionary alloc]init];
                        [refuseInfo setObject:[refuseElement attributeForName:@"title"] forKey:@"title"];
                        [refuseInfo setObject:[refuseElement attributeForName:@"name"] forKey:@"name"];
                        [refuseInfo setObject:[refuseElement attributeForName:@"value"] forKey:@"value"];
                        [refuseInfo setObject:[refuseElement attributeForName:@"mulit"] forKey:@"mulit"];
                        [refuseInfo setObject:[refuseElement attributeForName:@"submitflag"] forKey:@"submitflag"];
                        [refuseInfo setObject:[refuseElement attributeForName:@"message"] forKey:@"message"];
                        NSMutableArray * optionArray = [[NSMutableArray alloc]init];
                        for (id optionElement in [refuseElement elementsForName:@"option"]) {
                            NSMutableDictionary * optionInfo = [[NSMutableDictionary alloc]init];
                            [optionInfo setObject:[optionElement attributeForName:@"checked"] forKey:@"checked"];
                            [optionInfo setObject:[optionElement attributeForName:@"value"] forKey:@"value"];
                            [optionInfo setObject:[optionElement stringValue] forKey:@"title"];
                            [optionArray addObject:optionInfo];
                        }
                        [refuseInfo setObject:optionArray forKey:@"options"];
                        [refuseArray addObject:refuseInfo];
                    }
                    if (refuseArray.count != 0) {
                        [tdInfo setObject:refuseArray forKey:@"refuses"];
                    }
                    
                    
                    NSMutableArray *textareaArray = [[NSMutableArray alloc]init];
                    for (id textareaElement in [tdElement elementsForName:@"textarea"]) {
                        NSMutableDictionary * textareaInfo = [[NSMutableDictionary alloc]init];
                        [textareaInfo setObject:[textareaElement attributeForName:@"name"] forKey:@"name"];
                        [textareaInfo setObject:[textareaElement attributeForName:@"alt"] forKey:@"alt"];
                        [textareaInfo setObject:[textareaElement attributeForName:@"message"] forKey:@"message"];
                        [textareaInfo setObject:[textareaElement attributeForName:@"value"] forKey:@"value"];
                        [textareaInfo setObject:[textareaElement attributeForName:@"link"] forKey:@"link"];
                        [textareaInfo setObject:[textareaElement attributeForName:@"submitflag"] forKey:@"submitflag"];
                        [textareaArray addObject:textareaInfo];
                        
                    }
                    if (textareaArray.count != 0) {
                        [tdInfo setObject:textareaArray forKey:@"textareas"];
                    }
                    
                    [tdArray addObject:tdInfo];
                }
                [trInfo setObject:tdArray forKey:@"tds"];
                [trArray addObject:trInfo];
            }
            [tableInfo setObject:trArray forKey:@"trs"];
            [tableArray addObject:tableInfo];
        }
        [operationInfo setObject:tableArray forKey:@"tables"];
        [operationArray addObject:operationInfo];
    }
    
    NSLog(@"%@",operationArray);
}


@end
