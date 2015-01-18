//
//  DocumentWindowController.m
//  Xliffie
//
//  Created by b123400 on 18/1/15.
//  Copyright (c) 2015 b123400. All rights reserved.
//

#import "DocumentWindowController.h"
#import "DetailViewController.h"

@interface DocumentWindowController ()

@property (nonatomic, strong) ViewController *mainViewController;
@property (nonatomic, strong) DetailViewController *detailViewController;

@end

@implementation DocumentWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    NSSplitViewController *splitVc = (NSSplitViewController*)[self contentViewController];
    NSSplitViewItem *mainItem = [[splitVc splitViewItems] firstObject];
    self.mainViewController = (ViewController*)[mainItem viewController];
    self.mainViewController.delegate = self;
    
    self.detailViewController = (DetailViewController*)[[[splitVc splitViewItems] lastObject] viewController];
}

- (IBAction)toggleNotesPressed:(id)sender {
    NSSplitViewController *splitVc = (NSSplitViewController*)[self contentViewController];
    NSSplitViewItem *noteItem = [[splitVc splitViewItems] objectAtIndex:1];
    [[noteItem viewController] setPreferredContentSize:NSMakeSize(200, 600)];
    noteItem.animator.collapsed = !noteItem.animator.collapsed;
}

- (void)viewController:(id)controller didSelectedTranslation:(TranslationPair*)pair {
    [self.detailViewController setRepresentedObject:pair.note];
}

@end
