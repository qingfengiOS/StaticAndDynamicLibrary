//
//  ViewController.m
//  TesStaticLibrary
//
//  Created by liyiping on 2018/7/1.
//  Copyright © 2018年 情风. All rights reserved.
//

#import "ViewController.h"
#import "StaticLibrary.h"
#import <StaticLibrary_framework/Person.h>

#import <DynamicLibrary/DynamicLibrary.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self testStaticLibrary];
    [self testStaticFramework];
    
    [self testDynamicLib];
    /*
     静态库：链接时完整地拷贝至可执行文件中，被多次使用就有多份冗余拷贝。利用静态函数库编译成的文件比较大，因为整个 函数库的所有数据都会被整合进目标代码中，他的优点就显而易见了，即编译后的执行程序不需要外部的函数库支持，因为所有使用的函数都已经被编译进去了。当然这也会成为他的缺点，因为如果静态函数库改变了，那么你的程序必须重新编译。
     
     动态库：链接时不复制，程序运行时由系统动态加载到内存，供程序调用，系统只加载一次，多个程序共用，节省内存。由于函数库没有被整合进你的程序，而是程序运行时动态的申请并调用，所以程序的运行环境中必须提供相应的库。动态函数库的改变并不影响你的程序，所以动态函数库的升级比较方便。
     
     更多请看：https://www.jianshu.com/p/a200b593696b
     */
}

/**
 测试.a静态库
 */
- (void)testStaticLibrary {
    
    StaticLibrary *st = [StaticLibrary new];
    [st testLibrary];
    
    /**
     如果报错：undefined symboys for architecture x86_64，可能是库仅仅用于模拟器or真机，终端使用命令："lipo -info .a文件的路径"
     */
}


/**
 测试.framework 静态库
 */
- (void)testStaticFramework {
    
    Person *p = [Person new];
    [p testFramework];
}


/**
 测试自定义的动态库
 .tdb .dyld是我们无法打包的 我们能打包的还是.framework的动态库
 这里需要在target-> General -> Embedded Binaries 添加对应的动态库
 */
- (void)testDynamicLib {
    Animal *a = [Animal new];
    [a testDynamicLibrary];
}


@end
