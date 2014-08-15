//
//  ViewController.m
//  PersistingDataWNSUserDefaults
//
//  Created by John Malloy on 7/12/14.
//  Copyright (c) 2014 BigRedINC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.firstNameTextField.delegate = self;
    self.lastNameTextField.delegate = self;
    
    [self loadPersistentData:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(savePersistentData) name:UIApplicationDidEnterBackgroundNotification object:nil];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

-(IBAction)toggleActivity:(id)sender
{
    if (self.activitySwitch.on)
    {
        [self.activityIndicator startAnimating];
    }
    else
    {
        [self.activityIndicator stopAnimating];
    }
}


//The following method is actual storing of the data you are saving(persisting)

//You can user NSUserDefaults resetStandardUserDefaults method to clear all the data that's been previously stored.
-(void)savePersistentData:(id)sender
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
    //Set Objects/Values to save(persist)
    [userDefaults setObject:self.firstNameTextField.text forKey:@"First Name"];
    [userDefaults setObject:self.lastNameTextField.text forKey:@"Last Name"];
    [userDefaults setBool:self.activitySwitch.on forKey:@"activityOn"];
    
    //Save the changes
    [userDefaults synchronize];
}

-(void)loadPersistentData:(id)sender
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.firstNameTextField.text = [userDefaults objectForKey:@"firstName"];
    self.lastNameTextField.text = [userDefaults objectForKey:@"lastName"];
    [self.activitySwitch setOn:[userDefaults boolForKey:@"activityOn"] animated:NO];
    
    if (self.activitySwitch.on)
    {
        [self.activityIndicator startAnimating];
    }
}














@end
