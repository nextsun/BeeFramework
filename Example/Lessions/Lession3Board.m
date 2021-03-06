//
//  Lession3Board.m
//

#import "Lession3Board.h"

#pragma mark -

@implementation Lession3Board

DEF_SIGNAL( BACK );
DEF_SIGNAL( ENTER );

// Other signal goes here
- (void)handleUISignal:(BeeUISignal *)signal
{
	[super handleUISignal:signal];
}

// BeeUIBoard signal goes here
- (void)handleBeeUIBoard:(BeeUISignal *)signal
{
	[super handleUISignal:signal];
	
	if ( [signal is:BeeUIBoard.CREATE_VIEWS] )
	{
		[self setTitleString:@"Lession 3"];
		[self showNavigationBarAnimated:NO];
		
		_textView.contentInset = UIEdgeInsetsMake( 0, 0, 44.0f + 20.0f, 0.0f );
		
		_button1 = [[BeeUIButton alloc] initWithFrame:CGRectZero];
		_button1.backgroundColor = [UIColor blackColor];
		_button1.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
		_button1.stateNormal.title = @"< Back";
		_button1.stateNormal.titleColor = [UIColor whiteColor];
		[_button1 addSignal:Lession3Board.BACK forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:_button1];
		
		_button2 = [[BeeUIButton alloc] initWithFrame:CGRectZero];
		_button2.backgroundColor = [UIColor blackColor];
		_button2.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
		_button2.stateNormal.title = @"Enter >";
		_button2.stateNormal.titleColor = [UIColor whiteColor];
		[_button2 addSignal:Lession3Board.ENTER forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:_button2];
	}
	else if ( [signal is:BeeUIBoard.DELETE_VIEWS] )
	{
		SAFE_RELEASE_SUBVIEW( _button1 );
		SAFE_RELEASE_SUBVIEW( _button2 );
	}
	else if ( [signal is:BeeUIBoard.LAYOUT_VIEWS] )
	{
		CGRect buttonFrame;
		buttonFrame.size.width = (self.viewSize.width - 30.0f) / 2.0f;
		buttonFrame.size.height = 44.0f;
		buttonFrame.origin.x = 10.0f;
		buttonFrame.origin.y = self.viewSize.height - buttonFrame.size.height - 10.0f;
		
		_button1.frame = buttonFrame;
		_button2.frame = CGRectOffset(buttonFrame, buttonFrame.size.width + 10.0f, 0.0f);
	}
}

// Lession3Board signal goes here
- (void)handleLession3Board:(BeeUISignal *)signal
{
	if ( [signal is:Lession3Board.ENTER] )
	{
		Lession3Board * board = [[[Lession3Board alloc] init] autorelease];
		[self.stack pushBoard:board animated:YES];
	}
	else if ( [signal is:Lession3Board.BACK] )
	{
		[self.stack popBoardAnimated:YES];
	}
}

@end
