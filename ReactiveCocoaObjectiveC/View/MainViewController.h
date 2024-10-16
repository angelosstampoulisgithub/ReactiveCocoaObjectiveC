//
//  MainViewController.h
//  ReactiveCocoaObjectiveC
//
//  Created by Angelos Staboulis on 16/10/24.
//

#import <UIKit/UIKit.h>
#import "ViewModel.h"
#import "Services.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;
@property ViewModel *viewmodel;
@property Services *services;
@property (weak, nonatomic) IBOutlet UILabel *txtGender;
@property (weak, nonatomic) IBOutlet UILabel *txtProbability;
- (IBAction)btnFillFields:(id)sender;

@end

NS_ASSUME_NONNULL_END
