//
//  SqlDataTemplate.m
//  storyboardTest
//@基于coreData做sqllite本地数据库存储类
//coreData存在的意义：
//1,是用来解决客户端文件固化大数据量与复杂数据结构而存在的
//2,客户端文件固化无法实现增量读取、更新、删除、插入特性，都是整存整取，故对于大的数据读取与修改非常不方便，性能也不高
//3,coreData提供objec-relational mapping,可将obj-c对象转化为数据，并可将数据保存为sqLit数据库类型文件
//
//必要的依赖：1，coreData.framework,
//  Created by huguiqi on 14-9-6.
//  Copyright (c) 2014年 huguiqi. All rights reserved.
//

#import "SqlDataTemplate.h"
#import "FileManager.h"
#import <CoreData/CoreData.h>
#import "AccountEntity.h"
#import "LoginEntity.h"

@interface SqlDataTemplate()
{
    NSURL *storeUrl;
}
@property (readonly, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation SqlDataTemplate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;


- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}


// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"WolfDB" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}


// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [NSURL fileURLWithPath:[FileManager filePath:@"WolfDB.data"]];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    // Allow inferred migration from the original version of the application.
    NSDictionary *options = @{ NSMigratePersistentStoresAutomaticallyOption : @YES, NSInferMappingModelAutomaticallyOption : @YES };
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


-(BOOL)save:(AccountForm *)form{
    NSError *err = nil;
    
    AccountEntity *entity = (AccountEntity *)[NSEntityDescription insertNewObjectForEntityForName:@"AccountEntity" inManagedObjectContext:self.managedObjectContext];
    entity.userName = form.name;
    entity.age = form.age;
    entity.password = form.password;
    entity.id = [[NSNumber alloc] initWithInt:1];
    
    BOOL success = [_managedObjectContext save:&err];
    if (!success) {
        NSLog(@"error saving:%@",err);
    }
    return success;
}

-(NSArray *)loadAccountList
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"AccountEntity" inManagedObjectContext:self.managedObjectContext];
	[request setEntity:entity];
	
	// Order the events by creation date, most recent first.
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"age" ascending:NO];
	[request setSortDescriptors:@[sortDescriptor]];
	
	// Execute the fetch -- create a mutable copy of the result.
	NSError *error = nil;
	NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
	if (mutableFetchResults == nil) {
		// Handle the error.
	}
	
	// Set self's events array to the mutable array, then clean up.
	return mutableFetchResults;
}

@end
