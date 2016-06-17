//
//  main.m
//  OC 串讲-（数值封装）
//
//  Created by qingyun on 16/4/15.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //装箱和拆箱
        //1.NSNumber 封装基本数据类型
        //2.NSValue  封装任意类型  NSNumber的父类
        
        //装箱  任意类型---->对象
        NSNumber *iNum=[NSNumber numberWithInt:21];
        NSNumber *fNum=[NSNumber numberWithFloat:2.3];
        NSArray *arr1=@[@"hello",iNum,@(99.9),fNum];
        NSLog(@"arr1=%@",arr1);
        //拆箱  对象----->任意类型
        NSLog(@"iNUm=%d,%@",[iNum intValue],iNum);
        NSLog(@"fnUm=%g",[arr1[2] floatValue]);
        
        double d=3.14;
        NSValue *dVal=[NSValue value:&d withObjCType:@encode(double)];//装箱
        NSLog(@"dVal=%@",dVal);
        //拆箱
        double f;
        [dVal getValue:&f];
        NSLog(@"read=%g",f);
        //装箱
        NSValue *pVal=[NSValue valueWithPoint:NSMakePoint(23.2, 2.2)];
        NSLog(@"pVal=%@",pVal);
        //拆箱
        NSPoint mypoint=[pVal pointValue];
        NSLog(@"{%g,%g}",mypoint.x,mypoint.y);
        NSLog(@"%@",NSStringFromPoint(mypoint));
        
        
        //nil空对象，没有内存，在集合中作为结束标志！
        //NULL 是C中的空指针
        //@"" 有内存，但是没有值！
        //NSNull 可以放入集合，表示没有 的空对象,一个工程只会给NSNull分配一个内存！
        char *p=NULL;
        char name[100]="china";
        p=name;
        NSLog(@"%s,%p,%p",p,p,name);
        NSArray *arr2=[NSArray arrayWithObjects:@"qingyun",[NSNull null],@"", NULL,nil];
        NSLog(@"arr2=%@",arr2);
        for (id obj in arr2)
        {
            if ([obj isEqual:@"qingyun"])
            {
                NSLog(@"qingyun");
            }
            else if ([obj isEqual:[NSNull null]])
            {
                NSLog(@"NSNull 对象");
            }
            else if ([obj isEqualToString:@""])
            {
                NSLog(@"这是一个@\"\" ");
            }
            else//不会走
            {
                NSLog(@"空 ");
            }
        }
        NSArray *arr3;
        if (arr3==nil)//表示没有内存!arr3
        {
            NSLog(@"arr3=%@",arr3);
        }
        NSString *str=[NSString stringWithFormat:@"cscs"];
        if (str&&![str isEqualToString:@""])
        {
            NSLog(@"有内存，有内容");
        }
    }
    return 0;
}
